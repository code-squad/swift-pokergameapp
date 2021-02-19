import Foundation

class Players {
    private var players: [Playable]
    var list: [Playable] {
        return players
    }
    
    init() {
        self.players = [Playable]()
    }
    
    init(of players: [Playable]) {
        self.players = players
    }
    
    public func registerPlayers(numberOfPlayer: Participant) {
        players = [Playable]()
        
        for _ in 1...numberOfPlayer.rawValue {
            let player = Player()
            players.append(player)
        }
        let dealer = Dealer()
        players.append(dealer)
    }
    
    public func resetPlayersCard() {
        players.forEach { (player) in
            player.resetCard()
        }
    }
}
