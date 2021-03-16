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

/*CaseIterable을 사용함으로써 for-loop 으로 init화 시킬수 있다.
 CustomStringConvertible 를 학습하여 rawValue를 안쓰는법을 조금은 더 이해함.
 */

enum SuitCard : String, CaseIterable, CustomStringConvertible {
    case Spade,Club,Heart,Diamond
    
    var description: String {
        switch self {
        case .Spade:
            return "♠️"
        case .Club:
            return "♣️"
        case .Heart:
            return "♥️"
        case .Diamond:
            return "♦️"
        }
    }
    
    
}

/*Type을 Character로 하려고 했으나, case Ten = 10 으로 인해서 String으로 타입 지정.*/
enum NumberOfCard : String, CaseIterable, CustomStringConvertible{
    
    case Ace,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten,Jack,Queen,King
    
    var description: String {
        switch self {
        case .Ace:
            return "A"
        case .Two:
            return "2"
        case .Three:
            return "3"
        case .Four:
            return "4"
        case .Five:
            return "5"
        case .Six:
            return "6"
        case .Seven:
            return "7"
        case .Eight:
            return "8"
        case .Nine:
            return "9"
        case .Ten:
            return "10"
        case .Jack:
            return "J"
        case .Queen:
            return "Q"
        case .King:
            return "K"
        }
    }
    
}


class Card : CustomStringConvertible {
    
    /*변수 출력을 함수 대체, customStringConvertible 프로토콜을 이용*/
    var description: String {        
        return "\(self.suit)\(self.number)"
    }
    
    private var suit : SuitCard //4가지 모양을 알아내기 위해.
    private var number : NumberOfCard
    
    init(_ suit : SuitCard , _ numberOfCard : NumberOfCard ) {
        self.suit = suit
        self.number = numberOfCard
    }
    
}
