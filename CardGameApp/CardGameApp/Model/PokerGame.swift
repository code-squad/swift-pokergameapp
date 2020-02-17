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
            participants[count].giveRoleName(role: "참여자#\(count+1)")
        }
        dealer.giveRoleName(role: "딜러")
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
            return
        }
        for _ in 0..<cardsCount {
            guard let pickedCard = dealer.pickOneCard() else { return }
            dealer.recieveCard(newCard: pickedCard)
            for participant in participants {
                guard let pickedCard = dealer.pickOneCard() else { return }
                participant.recieveCard(newCard: pickedCard)
            }
        }
    }
}
