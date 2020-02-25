//
//  DataManager.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/24.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

@objcMembers class DataManager: NSObject {
    dynamic var game: Game = Game.fiveCardStud(gamers: Players())
}

extension DataManager: StackViewDataSource {
    func stackForAt(_ fact: Bool) {
        fact == true ? game.translateStyle(style: .five) : game.translateStyle(style: .seven)
        let new = game
        game = new
    }
    
    func numberOfRow(selectedItem: Int) {
        game.configure(index: selectedItem)
        let new = game
        game = new
    }
}
