//
//  DataManager.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/24.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

@objcMembers class DataManager: NSObject {
    dynamic var game = Game.fiveCardStud(gamers: Players())
}

extension DataManager: StackViewDataSource {
    func stackForAt(_ fact: Bool) {
        
    }
    
    func numberOfRow(row: Int) {
        
    }
}
