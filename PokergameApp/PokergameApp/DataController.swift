//
//  DataController.swift
//  PokergameApp
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let notifyWinner = Notification.Name(rawValue: "notifyWinner")
}

class DataController {
    private var cardGamePlay = CardGamePlay(number: .three, gameType: .sevenCard)
    
    init(){}
    func play(playerType: PlayerType, gameType: GameType){
        cardGamePlay = CardGamePlay.init(number: playerType, gameType: gameType)
        guard let winner = cardGamePlay.playGame() else {
            return
        }
        var userInfo = [String: GameWinner]()
        userInfo.updateValue(winner, forKey: "result")
        NotificationCenter.default.post(name: .notifyWinner, object: nil, userInfo: userInfo)
    }
}
