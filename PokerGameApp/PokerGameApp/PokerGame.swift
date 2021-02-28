import UIKit

class PokerGame{
    private var gameStyle : GameStyle
    private let dealer : Dealer
    private var players : Players
    
    init(GameStyle : GameStyle, gamePlayers: Players.GamePlayers) {
        self.gameStyle = GameStyle
        self.players = Players.init(playerCount: gamePlayers)
        self.dealer = Dealer.init(dealerdeck: Deck())
    }

    func initPokerGame(){
        players.decidePlayerNum()
        dealer.deckCreateShuffle()
    }
    
    func drawCardinView(mainView : UIView, cardView : UIView){
        gameStyle.decideDrawCardNumbers(mainView: mainView, cardview: cardView, players: players, dealer: dealer)
    }
    
    func setGameStyle(GameStyle : GameStyle){
        gameStyle = GameStyle
    }
    
    func setPlayerNumber(Players : Players.GamePlayers){
        players.setplayers(Players : Players)
    }
    
    func CardShake(mainView : UIView, cardView : UIView){
        if !isCardremain() {
            return
        }
        else{
            players.decidePlayerNum()
            dealer.distributeCard(players: players, GameStyle: gameStyle, dealer: dealer)
            drawCardinView(mainView: mainView, cardView: cardView)
        }
    }
    
    func isCardremain() -> Bool{
        if gameStyle.needCardsforStartGame(players: players) < dealer.currentDeckcount() {
            return true
        }
        return false
    }
    
    func showPlayersHands(){
        players.showYourHands()
        dealer.showMyHands()
    }
}

enum ErrorOfgame : Error{
    case lackCard
}
