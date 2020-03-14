//
//  Participant.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/14.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

class PokerPlayer {
    private var cardsInHand = [Card]()
    private var combinedCards = [Card]()
    private var name : String = ""
    private let handCombination = HandCombination()
    private var typesOfCombination = [Combination]()
    
    func addOneCard(newCard: Card) {
        self.cardsInHand.append(newCard)
    }
    
    func showEachCardInHand(behavior: (Card) -> () ) {
        cardsInHand.forEach(behavior)
    }
    
    func decideName(with text: String){
        self.name = text
    }
    
    func describeSelf()-> String {
        return self.name
    }
    
    func showEachMyCombination(behavior: (Combination) -> ()){
        typesOfCombination.forEach(behavior)
    }
    
    func showHighestRank(behavior: (Card) -> ()) -> Card?{
        combinedCards.sort(by: >)
        guard let highestRank = combinedCards.first else { return nil }
        return highestRank
    }
    
    func findMyCombination(){
        let checkResult = handCombination.submitCheckResult(of: cardsInHand)
        
        self.combinedCards += checkResult.0
        self.typesOfCombination += checkResult.1
    }
}

extension PokerPlayer : Hashable{
    static func == (lhs: PokerPlayer, rhs: PokerPlayer) -> Bool {
        return lhs.name == rhs.name && lhs.cardsInHand == rhs.cardsInHand && lhs.combinedCards == rhs.combinedCards && rhs.typesOfCombination == lhs.typesOfCombination && rhs.handCombination === lhs.handCombination
        
    }
    
    func hash(into hasher: inout Hasher) {
       hasher.combine(name)
       hasher.combine(cardsInHand)
       hasher.combine(combinedCards)
       hasher.combine(handCombination)
       hasher.combine(typesOfCombination)
    }
}

class Dealer : PokerPlayer {
    private var cardDeck = CardDeck()

    func giveOneCard() -> Card {
        return cardDeck.removeOne(of: 0)
    }
    
    func shuffleCardDeck() {
        self.cardDeck.shuffle()
    }
}


