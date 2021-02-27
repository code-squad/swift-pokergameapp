import UIKit

class PokerGame{
    private var gameStyle : GameStyle
    private let dealer : Dealer
    private var players : Players
    
    init(GameStyle : GameStyle, gamePlayers: Int) {
        self.gameStyle = GameStyle
        self.players = Players.init(playerCount: gamePlayers)
        self.dealer = Dealer.init(dealerdeck: Deck())
    }

    func gameStart(){
        players.decidePlayerNum()
        dealer.deckCreateShuffle()
        dealer.distributeCard(players: players, GameStyle: gameStyle, dealer: dealer)
    }
    
    func showPlayersHands(){
        players.showYourHands()
        dealer.showMyHands()
    }
}

enum ErrorOfgame : Error{
    case lackCard
}
