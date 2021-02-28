//
//  Players.swift
//  PokerGameApp
//
//  Created by 박정하 on 2021/02/19.
//

import UIKit


class Players{
    private var players : [Player]
    private var playerCount : GamePlayers
    
    init(playerCount : GamePlayers){
        self.players = []
        self.playerCount = playerCount
    }
    
    enum GamePlayers : Int, CaseIterable{
        case two = 2, three = 3, four = 4
    }
    
    func decidePlayerNum() -> Void {
        players.removeAll()
        for _ in 0..<playerCount.rawValue{
            let newplayer = Player()
            players.append(newplayer)
        }
    }
    
    func distributeCardPlayers(deck : Deck){
        for i in 0..<players.count{
            let currentCard = deck.takeTopcard()
            players[i].receiveCard(currentCard)
            deck.removeTopCard()
        }
    }
    
    func setplayers(Players : Players.GamePlayers){
        playerCount = Players
    }
    
    func DealerPosition() -> Int{
        return players.count
    }
    
    func needCardsGamePlay(currentGameStyle : GameStyle.stud) -> Int{
        return currentGameStyle.rawValue * players.count
    }
    
    func drawCardPlayers(mainView : UIView , cardView : UIView, currentGameStyle : Int){
        for i in 0..<players.count{
            players[i].drawMycard(mainView: mainView, cardView: cardView, currentGameStyle: currentGameStyle, Pos: i) // 여기서 던질 때 y좌표 결정해 줘야함
        }
    }
}
