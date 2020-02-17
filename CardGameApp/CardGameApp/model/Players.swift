//
//  Players.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/17.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class Players {
    private var players = [Player]()
    
    // 여기서 배열탐색을 해야한다?
    // player들 세팅을 여기서 해줘야한다...
    // 그럼 참가자가 몇명인지는 어떻게 알수 있을까 게임타입?
    
    func participate(entryAmount: GameMode.Entry){
        let count = Int(entryAmount.description)!
        for _ in 1 ... count {
            let player = Player()
            players.append(player)
        }
    }
}
