//
//  CardScore.swift
//  PokergameApp
//
//  Created by hw on 22/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

/// 페어가 없을 경우 또는 같은 핸즈인 경우 숫자가 높은 카드를 가진 사람이 우승
/// 각각의 카드서열 가중치는 핸드값에 곱해서 기존 서열에 초과되지 않을 범위 ( highCard*14 < 2*onePair) 로 가중치를 부여함
/// highCard
///  - A > K > Q > J > 10 >...>2
///  - range : 14  >= ... >= 2
/// onePair
///  - 랭킹이 동일한 카드가 2장일 때. 2명 이상의 플레이어가 똑같이 원페어라면 숫자 높은 카드가 승리 K&K < A&A
///  - range : 280 >= ... >= 40
/// twoPair
///  - 동일한 랭킹의 카드 2장이 2세트 있는 경우. 2명 이상의 플레이어가 투페어라면 가장 높은 페어를 가진 핸드가 승리
///  - 두 번째 페어도 동일하다면 다섯 번째 카드('키커')가 높은 쪽이 승리
///  - range : 2_800 >= ... >= 400
/// triple
///  - 가진 카드 중 세 카드 숫자가 같은 경우
///  - range : 28_000 >= ... >= 4_000
/// straight
///  - 가진 카드 중 다섯 카드 숫자가 연속 번호인 경우 Ace의 경우 A,2,3,4,5 or A,K,Q,J,10 (더 높음) 이 가능
///  - range : 280_000 >= ... >= 40_000
/// fourCard
///  - 포카드.  가진 카드 중 네 카드 숫자가 같은 경우
///  - range : 2_800_000 >= ... >= 400_000
enum CardScore : Int, CustomStringConvertible {
    case highCard = 0
    case onePair = 2
    case twoPair = 1
    case triple = 3
    case straight = 5
    case fourCard = 4

    init (_ score: Int) {
        let highCardScope = CardScore.highCard.weightedScoreValue * CardNumber.ace.rawValue + 1
        let onePairScope = CardScore.onePair.weightedScoreValue * CardNumber.ace.rawValue + 1
        let twoPairScope = CardScore.twoPair.weightedScoreValue * CardNumber.ace.rawValue + 1
        let tripleScope = CardScore.triple.weightedScoreValue * CardNumber.ace.rawValue + 1
        let straightScope = CardScore.straight.weightedScoreValue * CardNumber.ace.rawValue + 1
        switch score {
        case 0..<highCardScope :
            self = CardScore.highCard
        case highCardScope..<onePairScope:
            self = CardScore.onePair
        case onePairScope..<twoPairScope:
            self = CardScore.twoPair
        case twoPairScope..<tripleScope:
            self = CardScore.triple
        case tripleScope..<straightScope:
            self = CardScore.straight
        default:
            self = CardScore.fourCard
        }
    }

    var weightedScoreValue: Int {
        switch self {
        case .highCard:
            return 1
        case .onePair:
            return self.rawValue * 10
        case .twoPair:
            return self.rawValue * 200
        case .triple:
            return self.rawValue/3 * 2_000
        case .straight:
            return self.rawValue * 4_000
        case .fourCard:
            return self.rawValue * 50_000
        }
    }

    var description: String {
        switch self {
        case .highCard:
            return "하이카드"
        case .onePair:
            return "원페어"
        case .twoPair:
            return "투페어"
        case .triple:
            return "트리플"
        case .straight:
            return "스트레이트"
        case .fourCard:
            return "포카드"
        }
    }
}
