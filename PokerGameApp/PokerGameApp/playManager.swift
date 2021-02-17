//
//  playManager.swift
//  PokerGameApp
//
//  Created by 박정하 on 2021/02/17.
//

import UIKit

func initGameplay(){
    let viewCon = ViewController()
    
    let pattern : UIImage = UIImage(named: "bg_pattern")!
    viewCon.view.backgroundColor = UIColor(patternImage: pattern)
    var CardViewer : [UIImageView] = []
    let CARDNUMBER : CGFloat = 7
    let CARDHEIGHTRATIO : CGFloat = 1.27
    let cardXpos : CGFloat = viewCon.view.frame.size.width / CARDNUMBER
    let offset : CGFloat = CGFloat(viewCon.view.frame.size.width/2) - CGFloat(viewCon.view.frame.width/7 * 4) + CGFloat((viewCon.view.frame.width/(CARDNUMBER+1))/2)
    let cardWidth : CGFloat = viewCon.view.frame.size.width / (CARDNUMBER + 1)
    let cardHeight : CGFloat = cardWidth * CARDHEIGHTRATIO
    let cardBack : String? = "card-back"
    var cardBackImage : UIImage? = nil
    
    if let cardname = cardBack{
        cardBackImage = UIImage(named: cardname)
    }
    
    for i in 0..<Int(CARDNUMBER){
        let j : CGFloat = CGFloat(i)
        CardViewer.append(UIImageView(image: cardBackImage))
        CardViewer[i].frame = CGRect(x: cardXpos * j - offset, y: 50, width: cardWidth , height: cardHeight)
        viewCon.view.addSubview(CardViewer[i])
    }
}
