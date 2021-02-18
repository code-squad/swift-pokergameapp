import Foundation
class Players {
    var players: [Player]
    
    init() {
        self.players = [Player]()
    }
    
    func appendGamePlayer(gamePlayer:Player) {
        players.append(gamePlayer)
    }
    
}
