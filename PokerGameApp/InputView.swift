//
//  InputView.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/17.
//

import Foundation
import UIKit

struct InputView {
    enum PlayersCount : Int {
        case none, one, two, three, four
    }

    enum CardStud : Int {
        case five = 5
        case seven = 7
        case none = 0
    }
    
    static func segmentToCardSqud(_ segmentControl : UISegmentedControl) -> InputView.CardStud {
        let value = segmentControl.selectedSegmentIndex
        switch value {
        case 0 : return InputView.CardStud.five
        case 1 : return InputView.CardStud.seven
        default:
            return InputView.CardStud.none
        }
    }
    static func segmentToPlayersCount(_ segmentControl : UISegmentedControl) -> InputView.PlayersCount {
        let value = segmentControl.selectedSegmentIndex
        switch value {
        case 0 : return InputView.PlayersCount.two
        case 1 : return InputView.PlayersCount.three
        case 2 : return InputView.PlayersCount.four
        default : return InputView.PlayersCount.none
        }
    }
}
