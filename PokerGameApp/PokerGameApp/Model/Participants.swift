//
//  Participants.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/18.
//

import Foundation

class Participants {
    private var participants: [Participant] = []
    // 현재 카드를 받을 participant 를 나타낸다. (카드를 받을 차례)
    private var currentIndex: Int

    init(number ofParticipant: Int) {
        currentIndex = 0
        for _ in 1...ofParticipant {
            let participant = Participant(name: PlayerType.Pariticipant)
            participants.append(participant)
        }
    }
    var count: Int {
        return self.participants.count
    }
    func receiveCard(_ card: Card) {
        participants[currentIndex].receiveCard(card)
        // 카드를 받고난 후 다음차례에 선수가 받을 수 있도록 index를 증가시켜준다. (단, 마지막 차례였을 경우 다시 처음 플레이어에게 순서를 넘겨준다.)
        currentIndex = currentIndex == participants.count-1 ? 0 : currentIndex+1
    }
    func getParticipants() -> [Participant] {
        return participants
    }
}
//// 데이터 잘들어갔나 확인용
//extension Participants: CustomStringConvertible {
//    var description: String {
//        var str = ""
//        self.participants.forEach({ participant in
//            str.append("\(participant)\n")
//        })
//        return str
//    }
//}
