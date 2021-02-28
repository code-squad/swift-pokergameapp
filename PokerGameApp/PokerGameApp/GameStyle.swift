//
//  GameStyle.swift
//  PokerGameApp
//
//  Created by 박정하 on 2021/02/27.
//

import UIKit

class GameStyle {
    private var CurrentGameStyle : stud
    
    init(GameStyle : stud){
        self.CurrentGameStyle = GameStyle
    }
    
    public enum stud : Int, CaseIterable{
        case sevencards = 7, fivecards = 5
    }
    
    func distributeCardGameStyle(deck : Deck, players : Players, dealer : Dealer){
        for _ in 0..<CurrentGameStyle.rawValue{
            players.distributeCardPlayers(deck : deck)
            dealer.receiveCard(deck.takeTopcard())
        }
    }
    
    func needCardsforStartGame(players : Players) -> Int{
        let GameStyle : Int = players.needCardsGamePlay(currentGameStyle: CurrentGameStyle)
        return GameStyle + CurrentGameStyle.rawValue
    }
    
    func decideDrawCardNumbers(mainView: UIView, cardview : UIView, players : Players, dealer : Dealer){
        players.drawCardPlayers(mainView: mainView, cardView: cardview, currentGameStyle: CurrentGameStyle.rawValue)
        dealer.drawMycard(mainView: mainView, cardView: cardview, currentGameStyle: CurrentGameStyle.rawValue, Pos: players.DealerPosition())
    }
}
