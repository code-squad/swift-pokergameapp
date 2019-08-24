//
//  Hand.swift
//  PokergameApp
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

struct CardDictionary {
    var dictionary: [Int:[CardType]]
}

struct OrderedHandSet {
    var orderedKeyList:[Int] = []
    var orderedCardTypeList: [[CardType]] = [[]]
    init(_ playerScoreDictionary: CardDictionary){
        let result = playerScoreDictionary.dictionary.sorted
        { (lhs: (key: Int, value: [CardType]),
            rhs: (key: Int, value: [CardType])) -> Bool in
            return lhs.key < rhs.key
        }
        result.map { (element: (key: Int, value: [CardType])) in
            self.orderedKeyList.append(element.key)
            self.orderedCardTypeList.append(element.value)
        }
    }
}

private typealias CardScoreSet = (one: Int, two: Int, triple: Int, straight: Int, quad: Int )
struct Hand {
    private var myCardDeck : [Card]
    
    init(){
        myCardDeck = [Card]()
    }
    
    mutating func receiveCard(_ card: Card){
        myCardDeck.append(card)
    }
    
    func printFormat(format: ([Card])->Void ) {
        format(myCardDeck)
    }
    mutating func clear(){
        self.myCardDeck.removeAll()
    }
    
    mutating func sortOwnDeck() {
        self.myCardDeck.sort(by: { (card1, card2) in
            return card1.number.rawValue <= card2.number.rawValue
        })
    }
    
    func calculateEachPlayerHand() -> Int{
        var maxScore = myCardDeck[myCardDeck.count-1].number.rawValue * CardScore.highCard.weightedScoreValue
        guard let orderedHandSet = getOrderedHandSet() else{
            return maxScore
        }
        let onePair = getOnePairScore(orderedHandSet)
        let twoPair = getTwoPairScore(orderedHandSet)
        let triple = getTwoPairScore(orderedHandSet)
        let straight = getTriplePairScore(orderedHandSet)
        let quadruple = getFourCardScore(orderedHandSet)
        let cardScoreSet: CardScoreSet = CardScoreSet(onePair, twoPair, triple, straight, quadruple)
        maxScore = compareCardScores(currentMax: maxScore, scoreSet: cardScoreSet)
        return maxScore
    }
    
    private func compareCardScores (currentMax: Int, scoreSet: CardScoreSet ) -> Int {
        var maxScore = currentMax
        maxScore = maxScore > scoreSet.one ? maxScore : scoreSet.one
        maxScore = maxScore > scoreSet.two ? maxScore : scoreSet.two
        maxScore = maxScore > scoreSet.triple ? maxScore : scoreSet.triple
        maxScore = maxScore > scoreSet.straight ? maxScore : scoreSet.straight
        maxScore = maxScore > scoreSet.quad ? maxScore : scoreSet.quad
        return maxScore
    }
    private func getOrderedHandSet () -> OrderedHandSet? {
        let playerScoreDictionary = buildDeckDictionary()
        let orderedHandSet = OrderedHandSet.init(playerScoreDictionary)
        return orderedHandSet
    }
    
    private func getOnePairScore(_ result: OrderedHandSet) -> Int {
        let onePairNumber = getMultipleNumber(result, coefficient: CardScore.onePair.rawValue)
        let handValue = onePairNumber * CardScore.onePair.weightedScoreValue
        return handValue
    }
    
    private func getTwoPairScore(_ result: OrderedHandSet) -> Int {
        let onePairNumber = getMultipleNumber(result, coefficient: CardScore.onePair.rawValue)
        let twoPairNumber = getTwoPairNumber(result: result,
                                             coefficient: CardScore.onePair.rawValue, prevNumber: onePairNumber)
        var handValue = 0
        if onePairNumber == 0 {
            return handValue
        }
        handValue = twoPairNumber == 0 ? (onePairNumber * CardScore.onePair.weightedScoreValue)
                                        : (onePairNumber * CardScore.twoPair.weightedScoreValue)
        return handValue
    }
    
    private func getTriplePairScore(_ result : OrderedHandSet) -> Int {
        let tripleNumber = getMultipleNumber(result, coefficient: CardScore.triple.rawValue)
        let handValue = tripleNumber * CardScore.triple.weightedScoreValue
        return handValue
    }
    
    private func getStraightScore(_ result: OrderedHandSet) -> Int {
        let straightNumber = getStraightNumber(handSet: result, count: CardScore.straight.rawValue)
        let handValue = straightNumber * CardScore.straight.weightedScoreValue
        return handValue
    }
    
    private func getFourCardScore(_ result: OrderedHandSet) -> Int {
        let quardNumber = getMultipleNumber(result, coefficient: CardScore.fourCard.rawValue)
        let handValue = quardNumber * CardScore.fourCard.weightedScoreValue
        return handValue
    }
    
    //start from : 14(ACE) 13 12 11 10 9 8 7 6 5
    private func getStraightNumber(handSet: OrderedHandSet, count: Int) -> Int {
        var number = 0
        for index in stride(from: handSet.orderedKeyList.endIndex-1,
                            through: handSet.orderedKeyList.startIndex+3,
                            by: -1){
            if index > handSet.orderedKeyList.startIndex+3 && handSet.orderedCardTypeList[index].count > 0 {
                if isStraight(handSet: handSet, from: index) {
                    number = handSet.orderedKeyList[index]
                    break
                }
            }
            if index == handSet.orderedKeyList.startIndex+3 && isMinimalStraight(handSet: handSet, from: index){
                number = handSet.orderedKeyList[index]
                break
            }
        }
        return number
    }
    
    private func isMinimalStraight(handSet: OrderedHandSet, from : Int) -> Bool {
        var count = 1
        if (handSet.orderedCardTypeList[handSet.orderedKeyList.endIndex-1].count == 0){
            return false
        }
        for index in handSet.orderedCardTypeList.startIndex..<(from+1){
            count += (handSet.orderedCardTypeList[index].count > 0) ? 1: 0
        }
        let result = count == CardScore.straight.rawValue ? true : false
        return result
    }
    
    private func isStraight(handSet: OrderedHandSet, from: Int) -> Bool{
        var count = 0
        for element in from-4..<(from+1){
            count += (handSet.orderedCardTypeList[element].count > 0) ? 1 : 0
        }
        let result = count == CardScore.straight.rawValue ? true : false
        return result
    }
    
    private func getTwoPairNumber(result: OrderedHandSet, coefficient: Int = 2, prevNumber: Int ) -> Int {
        var number = 0
        for index in stride(from: result.orderedKeyList.endIndex-1,
                            through: result.orderedKeyList.startIndex,
                            by: -1) {
            if result.orderedKeyList[index] == prevNumber {
                continue
            }
            if result.orderedCardTypeList[index].count == coefficient {
                number = result.orderedKeyList[index]
                break
            }
        }
        return number
    }
    private func getMultipleNumber (_ result: OrderedHandSet, coefficient: Int)-> Int {
        var number = 0
        for index in stride(from: result.orderedKeyList.endIndex-1,
                            through: result.orderedKeyList.startIndex,
                            by: -1) {
            if result.orderedCardTypeList[index].count == coefficient {
                number = result.orderedKeyList[index]
                break
            }
        }
        return number
    }
    
    private func buildDeckDictionary() -> CardDictionary {
        var cardDictionary = initializeDictionary()
        for card in myCardDeck {
            let number = card.number.rawValue
            guard var eachType = cardDictionary.dictionary[number] else {
                break
            }
            eachType.append(card.type)
            cardDictionary.dictionary.updateValue(eachType, forKey: number)
        }
        return cardDictionary
    }
    
    private func initializeDictionary () -> CardDictionary {
        var dictionary = [Int : [CardType]]()
        for index in CardNumber.two.rawValue..<CardNumber.ace.rawValue+1 {
            dictionary.updateValue([CardType](), forKey: index)
        }
        return CardDictionary.init(dictionary: dictionary)
    }
}

