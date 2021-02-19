import Foundation

class PokerGame{
    
    private var gameStyle : Int
    private var deck : Deck
    private let dealer : Dealer
    private var players : Players
    
    init(GameStyle : Int, gamePlayers: Int) {
        self.gameStyle = GameStyle
        self.deck = Deck()
        self.players = Players.init(playerCount: gamePlayers)
        self.dealer = Dealer(dealerdeck: self.deck)
    }
    
    func gameStart(){
        players.decidePlayerNum()
        dealer.deckCreateShuffle()
        do {
            try dealer.cardDistribution(currentGame: self)
        }
        catch{
            print("카드가 부족합니다.")
        }
        for i in 0..<players.currentPlayers(){
            print("player #\(i)"); players.printCardplayers(index: i)
        }
        print("dealer"); dealer.printMyCard()
    }
    
    func isCardremain() -> Bool{
        let DEALERCOUNT = 1
        if deck.count() >= (players.currentPlayers() + DEALERCOUNT) * gameStyle{
            return true
        }
        return false
    }
    
    func distributeCard(){
        for _ in 0..<gameStyle{
            for i in 0..<players.currentPlayers(){
                players.throwCardtoPlayer(i, deck.takeTopcard())
                deck.removeTopCard()
            }
            dealer.receiveCard(deck.takeTopcard())
            deck.removeTopCard()
        }
    }
    
}

enum ErrorOfgame : Error{
    case lackCard
}

class Player {
    private var myCard : [Card]
    
    init(){
        self.myCard = []
    }
    
    func receiveCard(_ card : Card) -> Void{
        myCard.append(card)
    }
    
    func printMyCard(){
        print(myCard)
    }
}

class Players{
    private var players : [Player]
    private let playerCount : Int
    
    init(playerCount : Int){
        self.players = []
        self.playerCount = playerCount
        print("플레이어 카운트 \(self.playerCount)")
    }
    
    func decidePlayerNum() -> Void {
        for _ in 0..<playerCount{
            let newplayer = Player()
            players.append(newplayer)
        }
    }
    
    func printCardplayers(index : Int) -> Void{
        players[index].printMyCard()
    }
    
    func currentPlayers() -> Int{
        return players.count
    }
    
    func throwCardtoPlayer(_ index : Int, _ card : Card){
        players[index].receiveCard(card)
    }
}

class Dealer : Player{
    private let deck : Deck
    
    init(dealerdeck : Deck){
        self.deck = dealerdeck
    }
    
    func cardDistribution(currentGame: PokerGame) throws -> Void{
        guard currentGame.isCardremain() else{
            throw ErrorOfgame.lackCard
        }
        currentGame.distributeCard()
    }
    
    func deckCreateShuffle(){
        deck.resetDeck()
        deck.shuffleDeck()
    }
}
