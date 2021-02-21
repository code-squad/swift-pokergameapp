//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/17.
//

import Foundation

class PokerGame {
    public enum StudVariant: Int, CaseIterable {
        case fiveCardStud = 5
        case sevenCardStud = 7
    }
    
    public enum NumberOfPlayers: Int, CaseIterable {
        case two = 2
        case three
        case four
    }
    
    private var cardDeck = CardDeck()
    private var dealer = Dealer()
    private var players: Players
    private var numberOfCards: Int
    private var lackOfCard: Bool

    public init() {
        players = Players(with: 4)
        numberOfCards = 7
        lackOfCard = false
    }
    
    public func exportNumberOfPlayersOptions() -> [String] {
        var numberOfPlayersInString: Array<String> = []
        for element in NumberOfPlayers.allCases {
            numberOfPlayersInString.append(element.description)
        }
        return numberOfPlayersInString
    }
    
    public func exportStudVariantOptions() -> [String] {
        var studVariantInString: Array<String> = []
        for element in StudVariant.allCases {
            studVariantInString.append(element.description)
        }
        return studVariantInString
    }
    
    public func selectNumberOfPlayer(index: Int) {
        players = Players(with: NumberOfPlayers.allCases[index].rawValue)
    }
    
    public func selectStudVariant(index: Int) {
        numberOfCards = index == 0 ? 5 : 7
    }
    
    private func resetCardDeck() {
        cardDeck.reset()
        cardDeck.shuffle()
        print(cardDeck.count())
    }
    
    private func distribute() {
        for _ in 1...numberOfCards {
            players.cardForAll(cards: cardDeck)
            if let drawnCard = cardDeck.removeOne() {
                dealer.receive(card: drawnCard)
            } else {
                lackOfCard = true
                return
            }
        }
    }
    
    public func play() -> Array<Array<Card>>? {
        players.resetPlayers()
        dealer.resetDealer()
        resetCardDeck()
        distribute()
        if lackOfCard == true {
            print("카드 수 부족")
            return nil
        }
        print("\(players)")
        print("\(dealer)")
        print("\(cardDeck.count())")
        
        var cardDashboard: Array<Array<Card>> = players.giveCardInfoOfPlayers()
        cardDashboard.append(dealer.cardInfo())
        return cardDashboard
    }
}

extension PokerGame.StudVariant: CustomStringConvertible {
    var description: String {
        return "\(self.rawValue) cards"
    }
}

extension PokerGame.NumberOfPlayers: CustomStringConvertible {
    var description: String {
        return "\(self.rawValue)명"
    }
}
