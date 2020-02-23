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
        
        for _ in 0..<participantCount {
            participants.append(Participant())
        }
    }
    
    func showParticipants() -> [Participant] {
        return participants
    }
    
    func showDealer() -> Dealer {
        return dealer
    }
    
    func pickOneCard() -> Card? {
        return dealer.pickOneCard() ?? nil
    }
    
    func giveCards() {
        guard dealer.remainingCardsCount > cardsCount * (participantCount + 1) else {
            isContinueGame = false
            return
        }
        for _ in 0..<cardsCount {
            guard let pickedCard = pickOneCard() else { return }
            dealer.recieveCard(newCard: pickedCard)
            for participant in participants {
                guard let pickedCard = pickOneCard() else { return }
                participant.recieveCard(newCard: pickedCard)
            }
        }
    }
}
