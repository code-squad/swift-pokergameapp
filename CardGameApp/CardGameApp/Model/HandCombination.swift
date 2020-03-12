//
//  HandCombination.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/03/08.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

enum Combination: Int {
    case None = 0, OnePair = 1, TwoPair, Triple, Straight, FourCard
    func tellScore() -> Int{
        return self.rawValue
    }
}

class HandCombination{
    var combinedCardsRank = [Int]() // 조합을 이룬 카드들의 Rank
    var combinationTypes = [Int]() 
    var isOnePair : Bool = false
    var typesOfCombination = [Combination]() // 참가자가 갖고있는 카드들이 어떤 조합이 나왔는지
    
    func checkStraight(of cardsToCheck: [Int]) -> [Combination]{
        let combination = Combination.self
        
        // 중복된 수를 지우기
        let sortedCards = cardsToCheck.sorted()
        
        var duplicationRemovedCards = removeDuplication(in: sortedCards)
        
        // 연속 수 찾기
        var squenceCount = 0
        duplicationRemovedCards.sort(by: <)
        var cardRankToCompare = duplicationRemovedCards[0]
        for card in duplicationRemovedCards{
            
            if cardRankToCompare == card{
                cardRankToCompare += 1
                squenceCount += 1
            }
        }
        
        //연속된 수가 5개일 경우
        if squenceCount == 5{
            typesOfCombination.append(combination.Straight)
        }
        return typesOfCombination
    }
    
    func removeDuplication(in array: [Int]) -> [Int]{
        let set = Set(array)
        let duplicationRemovedArray = Array(set)
        return duplicationRemovedArray
    }
    
    func checkPair(of cardsToCheck: [Int]) -> [Combination]{
        var cardsToCheck = cardsToCheck.sorted()
        while cardsToCheck.count != 0 {
            // 0번째 인덱스에 있는 수와 같은 수 찾기
            let combi = cardsToCheck.filter{card in card == cardsToCheck[0]}
            let combinedCardsCount = combi.count
            
            // 같은 수가 2개 이상일 경우
            if combinedCardsCount > 1{
                combinedCardsRank.append(cardsToCheck[0])
                combinationTypes.append(combinedCardsCount)
                
                // 숫자를 조합 타입으로 변환해서 typesOfCombination에 추가
                addCombination(pairNumbers: combinationTypes)
            }
            
            let leftCardsToCheck = cardsToCheck.filter{card in card != cardsToCheck[0]}
            cardsToCheck = leftCardsToCheck
        }
        return typesOfCombination
    }
    
    func addCombination(pairNumbers : [Int]){
        let combination = Combination.self
        
        let pairCount = pairNumbers.filter{$0 == 2}.count
        let tripleCount = pairNumbers.filter{$0 == 3}.count
        let fourCardCount = pairNumbers.filter{$0 == 4}.count
        
        if pairCount == 1 {
            isOnePair = true
            typesOfCombination.append(combination.OnePair)
        }
        
        if pairCount > 1 && isOnePair == true {
            typesOfCombination.append(combination.TwoPair)
        }
        
        if tripleCount >= 1 {
            typesOfCombination.append(combination.Triple)
        }
        
        if fourCardCount >= 1 {
            typesOfCombination.append(combination.FourCard)
        }
    }
    
    func dealWithNilValue(){
        if typesOfCombination == nil{
            typesOfCombination.append(.None)
        }
        if combinedCardsRank == nil{
            combinedCardsRank.append(0)
        }
    }
    
    func submitCheckResult(of cardsToCheck: [Int])->([Int],[Combination]){
        let straightCombination = self.checkStraight(of: cardsToCheck)
        let pairCombination = self.checkPair(of: cardsToCheck)
        typesOfCombination += straightCombination
        typesOfCombination += pairCombination
        dealWithNilValue()
        typesOfCombination = Array(Set(typesOfCombination))
        combinedCardsRank = Array(Set(combinedCardsRank))
        return (combinedCardsRank, typesOfCombination)
    }
}
extension HandCombination: Hashable{
    static func == (lhs: HandCombination, rhs: HandCombination) -> Bool {
        return lhs.combinationTypes == rhs.combinationTypes && lhs.combinedCardsRank == rhs.combinedCardsRank && lhs.isOnePair == rhs.isOnePair
    }
    
    func hash(into hasher: inout Hasher) {
          hasher.combine(combinationTypes)
          hasher.combine(combinedCardsRank)
          hasher.combine(isOnePair)
       }
}
