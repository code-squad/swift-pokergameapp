import Foundation

class Players {
    private var players: [Playable]
    var list: [Playable] {
        return players
    }
    
    init() {
        self.players = [Playable]()
    }
    
    public func registerPlayers(numberOfPlayer: NumberOfParticipant, dealer: Dealer) {
        players = [Playable]()
        
        for index in 1...numberOfPlayer.rawValue {
            let player = Player(ID: index)
            players.append(player)
        }
        players.append(dealer)
    }
    
    public func resetPlayersCard() {
        players.forEach { (player) in
            player.resetCard()
        }
    }
}
