//
//  Card.swift
//  PokerGameApp
//
//  Created by jinseo park on 3/12/21.
//

import Foundation

/*Card OOP
 
 enum -> Suits, NumberToName 으로 변환시켜준다.
 
 Card 라는 기본 클래스를 제작하고, 4종류의 카드가 부모를 상속한다.(각각, suit의 init이 바뀐다)
 또한 카드의 속성을 알기위한 함수를 재사용하여 함수 생성을 최소화 시킨다.
 
 */
enum SuitCard : String {
    case Spade = "♠️"
    case Club = "♣️"
    case Heart = "♥️"
    case Diamond = "♦️"
}

enum NumberOfCard : String {

    case Ace = "A"
    case Jack = "J"
    case Queen = "Q"
    case King = "K"
}
class Card {
    var suit : String //4가지 모양을 알아내기 위해.
    var number : String //A,J,K,Q 를 표현하기 위함
    
    init(_ suit : String , _ number : String ) {
        self.suit = suit
        
        //1,11,12,13을 컨버팅 하기
        switch number {
        case "1":
            self.number = NumberOfCard.Ace.rawValue
        case "11":
            self.number = NumberOfCard.Jack.rawValue
        case "12":
            self.number = NumberOfCard.Queen.rawValue
        case "13":
            self.number = NumberOfCard.King.rawValue
        default:
            self.number = number
        }
        
    }
    func showCardInfo() {
        print(suit+number)
    }
}

class Spade : Card {
    init(_ number : String) {
        super.init(SuitCard.Spade.rawValue, number)
    }
    override func showCardInfo() {
        super.showCardInfo()
    }
}
class Club : Card {
    init(_ number : String) {
        super.init(SuitCard.Club.rawValue, number)
    }
    override func showCardInfo() {
        super.showCardInfo()
    }
}
class Heart : Card {
    init(_ number : String) {
        super.init(SuitCard.Heart.rawValue, number)
    }
    override func showCardInfo() {
        super.showCardInfo()
    }
}
class Diamond : Card {
    init(_ number : String) {
        super.init(SuitCard.Diamond.rawValue, number)
    }
    override func showCardInfo() {
        super.showCardInfo()
    }
}
