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
    
    func drawCard(playerindex: Int, cardindex : Int) -> String{
        return players.playerCards(playerindex: playerindex, cardindex: cardindex)
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
    
    func myCardDescription(index : Int) -> String{
        return myCard[index].description
    }
    
    func receiveCard(_ card : Card) -> Void{
        myCard.append(card)
    }
    
    func printMyCard(){
        print(myCard)
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
