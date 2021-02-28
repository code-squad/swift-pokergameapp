//
//  Player.swift
//  PokerGameApp
//
//  Created by 박정하 on 2021/02/27.
//

import UIKit

class Player {
    private var myCard : [Card]
    
    init(){
        self.myCard = []
    }
    
    func receiveCard(_ card : Card) -> Void{
        myCard.append(card)
    }
    
    func changeUnicodeToString(cardindex : Int) -> String{
        var cardName : String = ""
        var CharacterArrayCardName = Array(myCard[cardindex].description)
        switch CharacterArrayCardName[0]{
        case "♠︎":
            CharacterArrayCardName.removeFirst()
            cardName += "s" + String(CharacterArrayCardName)
            break;
        case "♣︎":
            CharacterArrayCardName.removeFirst()
            cardName += "c" + String(CharacterArrayCardName)
            break;
        case "♥︎":
            CharacterArrayCardName.removeFirst()
            cardName += "h" + String(CharacterArrayCardName)
            break;
        case "♦︎":
            CharacterArrayCardName.removeFirst()
            cardName += "d" + String(CharacterArrayCardName)
            break;
        default:
            break;
        }
        return cardName
    }
    
    func drawMycard(mainView : UIView, cardView : UIView, currentGameStyle : Int, Pos : Int){
        var cardimages : [UIImageView] = []
        
        let CARDXPOS : CGFloat = mainView.frame.width/CGFloat(currentGameStyle)
        let CARDYPOS : CGFloat = 150
        let OFFSETCENTER : Int = currentGameStyle/2 + 1
        let OFFSET : CGFloat = CGFloat(mainView.frame.size.width/2) - CGFloat(Int(mainView.frame.width)/currentGameStyle * OFFSETCENTER) + CGFloat((Int(mainView.frame.width)/(currentGameStyle+1))/2)
        let CARDWIDTH : CGFloat = mainView.frame.size.width/(CGFloat(currentGameStyle) + 1)
        let CARDHEIGHT : CGFloat = CARDWIDTH * 1.27
        
        for i in 0..<myCard.count{
            let CARDPOS : CGRect = CGRect(x: CARDXPOS * CGFloat(i) - OFFSET, y: CARDYPOS * CGFloat(Pos), width: CARDWIDTH, height: CARDHEIGHT)
            let cardName : String = changeUnicodeToString(cardindex: i)
            let TempcardView : UIImageView = UIImageView(image: UIImage(named: cardName))
            cardimages.append(TempcardView)
            TempcardView.frame = CARDPOS
            cardView.addSubview(TempcardView)
        }
    }
}
