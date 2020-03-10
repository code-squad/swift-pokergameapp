//
//  HandCombination.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/03/08.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import Foundation

enum Combination: Int {
    case OnePair = 1, TwoPair, Triple, Straight, FourCard
    func tellScore() -> Int{
        return self.rawValue
    }
}

class HandCombination{
    var combinedCardsRank = [Int]() // 조합을 이룬 카드들의 Rank
    var combinationTypes = [Int]() // 참가자가 갖고있는 카드들 중 각 조합을 이루기 위한 카드는 몇개였는지 (ex - Triple = 3, Straight = 5)
    var isOnePair : Bool = false
    var typesOfCombination = [Combination]() // 참가자가 갖고있는 카드들이 어떤 조합이 나왔는지
    
    func checkStraight(of cardsToCheck: [Int]) -> [Combination]{
        let combination = Combination.self
        
        // 중복된 수를 지우기
        let sortedCards = cardsToCheck.sorted()
        var duplicationRemovedCards = removeDuplication(in: sortedCards)
        
        // 연속 수 찾기
        var squenceCount = 0
        var cardRankToCompare = duplicationRemovedCards.sorted()[0]
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
    
    func removeDuplication(in cardsToCheck: [Int]) -> [Int]{
        let cardsSet = Set(cardsToCheck)
        let duplicationRemovedCards = Array(cardsSet)
        return duplicationRemovedCards
    }
    
    func checkPair(of cardsToCheck: [Int]) -> [Combination]{
        var cardsToCheck = cardsToCheck.sorted()
        while cardsToCheck.count != 0 {
            // 0번째 인덱스에 있는 수와 같은 수 찾기
            var combi = cardsToCheck.filter{card in card == cardsToCheck[0]}
            var combinedCardsCount = combi.count
            
            // 같은 수가 2개 이상일 경우
            if combinedCardsCount > 1{
                combinedCardsRank.append(cardsToCheck[0])
                combinationTypes.append(combinedCardsCount)
                
                // 숫자를 조합 타입으로 변환해서 typesOfCombination에 추가
                addCombination(pairNumbers: combinationTypes)
            }
            
            var leftCardsToCheck = cardsToCheck.filter{card in card != cardsToCheck[0]}
            cardsToCheck = leftCardsToCheck
        }
        return typesOfCombination
    }
    
    func addCombination(pairNumbers : [Int]){
        let combination = Combination.self
        
        var pairCount = pairNumbers.filter{$0 == 2}.count
        var tripleCount = pairNumbers.filter{$0 == 3}.count
        var fourCardCount = pairNumbers.filter{$0 == 4}.count
        
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
    
    func submitCombinedCards()->[Int]{
        return combinedCardsRank
    }
}
