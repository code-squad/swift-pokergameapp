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

/*Type을 Character로 하려고 했으나, case Ten = 10 으로 인해서 String으로 타입 지정.*/
enum NumberOfCard : String {

    case Ace = "A"
    case Two = "2"
    case Three = "3"
    case Four = "4"
    case Five = "5"
    case Six = "6"
    case Seven = "7"
    case Eight = "8"
    case Nine = "9"
    case Ten = "10"
    case Jack = "J"
    case Queen = "Q"
    case King = "K"
}


class Card : CustomStringConvertible {
    
    /*변수 출력을 함수 대체, customStringConvertible 프로토콜을 이용*/
    var description: String {
        return "\(suit.rawValue)  \(number.rawValue)"
    }
    
    var suit : SuitCard //4가지 모양을 알아내기 위해.
    var number : NumberOfCard //A,J,K,Q 를 표현하기 위함
    
    init(_ suit : SuitCard , _ numberOfCard : NumberOfCard ) {
        self.suit = suit
        self.number = numberOfCard
    }
    
}

class Spade : Card {
    init(_ numberOfCard : NumberOfCard) {
        super.init(SuitCard.Spade, numberOfCard)
    }
}

class Club : Card {
    init(_ numberOfCard : NumberOfCard) {
        super.init(SuitCard.Club, numberOfCard)
    }
    
}
class Heart : Card {
    init(_ numberOfCard : NumberOfCard) {
        super.init(SuitCard.Heart, numberOfCard)
    }
    
}
class Diamond : Card {
    init(_ numberOfCard : NumberOfCard) {
        super.init(SuitCard.Diamond, numberOfCard)
    }
    
}
