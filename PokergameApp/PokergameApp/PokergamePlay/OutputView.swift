//
//  OutputView.swift
//  cardGameRefactor
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

struct OutputView {
    static func printOutput(_ players: [Playable]){
        let format = { (name: String, hand: Hand) in
            print("\(name):", terminator: " ")
            let innerFormat = { (deck: [Card]) in
                deck.forEach({ (card) in
                    print(card.description, terminator: " ")
                })
            }
            hand.printFormat(format: innerFormat)
            print()
        }
        players.forEach { (player) in
            player.receivePrintFormat(format)
        }
    }
}
