//
//  Dealer.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/12.
//  Copyright © 2020 Cloud. All rights reserved.
//

class Dealer: Gamer {
    
    private var deck: Deck = {
        var deck: Deck = Deck()
        deck.shuffle()
        return deck
    }()
    private var game: Game
    
    init(game: Game) {
        self.game = game
        super.init(identifier: "dealer")
    }
    
    /// 처음에는 4장을 주고, 그 다음에 게임 방식에 따라서 남은 카드를 한장씩 나눠주기 위해서 아래처럼 구현했습니다.
    func distributeBundle() {
        var remainingNumber = 0
        game.takeInformation { gamers, style in
            remainingNumber = style.description - 4
            let firstDistributeRange = (1...4)
            gamers.forEach { gamer in
                firstDistributeRange.forEach { _ in
                    guard let card = deck.removeOne() else { return }
                    gamer.addCard(card: card)
                }
            }
            distributeOrder(count: remainingNumber)
        }
    }
    
    func distributeOrder(count: Int) {
        (1...count).forEach { _ in
            game.takeInformation { gamers, style in
                gamers.forEach{ gamer in
                    guard let card = deck.removeOne() else { return }
                    gamer.addCard(card: card)
                }
            }
        }
    }
    
    func pushGame(handler: (Game) -> Void ) {
        handler(game)
    }
}
