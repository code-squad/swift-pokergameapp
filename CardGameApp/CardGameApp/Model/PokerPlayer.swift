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
    private var combinedCardsRank = [Int]()
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
    
    func showHighestRank(behavior: (Int) -> ()) -> Int{
        combinedCardsRank.sort(by: >)
        guard let highestRank = combinedCardsRank.first else { return 0 }
        return highestRank
    }
    
    func findMyCombination(){
        let cardsRanksInHand = watchCardRanksInHand()
        let checkResult = handCombination.submitCheckResult(of: cardsRanksInHand)
        self.combinedCardsRank += checkResult.0
        self.typesOfCombination += checkResult.1
    }
    
    func watchCardRanksInHand() -> [Int]{
        var cardsRanksInHand = [Int]()
        self.cardsInHand.forEach{ card in
            cardsRanksInHand.append(card.cardNumber)
        }
        return cardsRanksInHand
    }
    
}

extension PokerPlayer : Hashable{
    static func == (lhs: PokerPlayer, rhs: PokerPlayer) -> Bool {
        return lhs.name == rhs.name && lhs.cardsInHand == rhs.cardsInHand && lhs.combinedCardsRank == rhs.combinedCardsRank && rhs.typesOfCombination == lhs.typesOfCombination && rhs.handCombination === lhs.handCombination
        
    }
    
    func hash(into hasher: inout Hasher) {
       hasher.combine(name)
       hasher.combine(cardsInHand)
       hasher.combine(combinedCardsRank)
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


