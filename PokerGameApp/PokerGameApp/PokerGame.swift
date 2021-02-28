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

    func gameStart(){
        players.decidePlayerNum()
        dealer.deckCreateShuffle()
        dealer.distributeCard(players: players, GameStyle: gameStyle, dealer: dealer)
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
        if isCardremain() {
            players.decidePlayerNum()
            dealer.distributeCard(players: players, GameStyle: gameStyle, dealer: dealer)
            drawCardinView(mainView: mainView, cardView: cardView)
        }
        else{
            print("카드 부족해서 더 게임 못함") // 일단 기능 확인용
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
