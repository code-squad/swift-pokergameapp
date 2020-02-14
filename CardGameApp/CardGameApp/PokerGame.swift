import Foundation

class PokerGame {
    private var participants = [Participant]()
    private var dealer = Dealer()
    private var cardsCount: Int
    private var participantCount: Int
    private var isContinueGame = true
    
    init(gameMode: Mode.GameMode, playerMode: Mode.PlayerMode) {
        cardsCount = gameMode.rawValue
        participantCount = playerMode.rawValue
        
        for count in 0..<participantCount {
            participants.append(Participant())
            participants[count].role += "#\(count+1)"
        }
    }
    
    func showParticipants() -> [Participant] {
        return participants
    }
    
    func showDealer() -> Dealer {
        return dealer
    }
    
    func giveCards() {
        guard dealer.remainingCardsCount > cardsCount * (participantCount + 1) else {
            isContinueGame = false
            print("카드 갯수가 부족합니다.")
            return
        }
        for _ in 0..<cardsCount {
            guard let pickedCard = dealer.pickOneCard() else { return }
            dealer.cards.append(pickedCard)
            for participant in participants {
                guard let pickedCard = dealer.pickOneCard() else { return }
                participant.cards.append(pickedCard)
            }
        }
    }
    
    func openCards() {
        if isContinueGame {
            print("-------------------- Current Card Status --------------------")
            for index in 0..<participantCount {
                print("\(participants[index].role) \(participants[index].cards)")
            }
            print("\(dealer.role) \(dealer.cards)\n")
        } else {
            print("게임이 종료되었습니다.\n")
        }
    }
}
