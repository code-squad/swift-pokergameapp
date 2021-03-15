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


fileprivate let TOTALCARDS : Int = 52

/*CaseIterable을 사용함으로써 for-loop 으로 init화 시킬수 있다.*/
enum SuitCard : String, CaseIterable {
    case Spade = "♠️"
    case Club = "♣️"
    case Heart = "♥️"
    case Diamond = "♦️"
}

/*Type을 Character로 하려고 했으나, case Ten = 10 으로 인해서 String으로 타입 지정.*/
enum NumberOfCard : String, CaseIterable {
    
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
        return "\(suit.rawValue)\(number.rawValue)"
    }
    
    private var suit : SuitCard //4가지 모양을 알아내기 위해.
    private var number : NumberOfCard //A,J,K,Q 를 표현하기 위함
    
    init(_ suit : SuitCard , _ numberOfCard : NumberOfCard ) {
        self.suit = suit
        self.number = numberOfCard
    }
    
}

class CardDeck {
    
    /*외부에서 접근 불가해야함.*/
    private var deck : [Card] = []
    
    init() {
        //52장 총 4종류의 13개씩 있어야한다.
        self.deck.reserveCapacity(TOTALCARDS) //총 52장의 카드를 가지고 있다.
        
        resetDeck()
    }
    
    func getCountOfCurrentDeck() -> Int {
        return deck.count
    }
    
    
    func pickOneCard() {
        let card = self.deck.removeLast()
        print(card,"\n 총 \(self.deck.count) 카드 존재" )
    }
    
    /* Durstenfeld's version Shuffle a Deck. */
    func shuffleDeck() {
        var newDeck : [Card] = []
        while getCountOfCurrentDeck() > 0 {
            let randNum = Int.random(in: 0 ..< getCountOfCurrentDeck())
            (self.deck[getCountOfCurrentDeck() - 1], self.deck[randNum]) = (self.deck[randNum], self.deck[getCountOfCurrentDeck() - 1])
            newDeck.append(self.deck.removeLast())
        }
        self.deck = newDeck
        print("카드를 섞음\n 총 \(self.deck.count) 카드 존재")
    }
    
    /* Reset the card. */
    func resetDeck() {
        self.deck.removeAll()
        /* append all kind of cards to deck. */
        SuitCard.allCases.forEach {
            let suit = $0
            NumberOfCard.allCases.forEach {
                let numberOfCard = $0
                self.deck.append(Card.init(suit, numberOfCard))
            }
        }
        print("카드를 초기화 함\n 총 \(self.deck.count) 카드 존재")
    }
    
    func showCardDeck() {
        print(self.deck)
    }
    
}
