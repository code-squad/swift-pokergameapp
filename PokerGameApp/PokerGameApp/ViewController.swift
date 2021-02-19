//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 박정하 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle{
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGameplay()
        let game = PokerGame.init(GameStyle: 5) //게임 스타일 결정
        game.gameStart()
    }
    
    func initGameplay(){
        let pattern : UIImage = UIImage(named: "bg_pattern")!
        self.view.backgroundColor = UIColor(patternImage: pattern)
        var CardViewer : [UIImageView] = []
        let CARDNUMBER : CGFloat = 7
        let CARDHEIGHTRATIO : CGFloat = 1.27
        let cardXpos : CGFloat = self.view.frame.size.width / CARDNUMBER
        let offset : CGFloat = CGFloat(self.view.frame.size.width/2) - CGFloat(self.view.frame.width/7 * 4) + CGFloat((self.view.frame.width/(CARDNUMBER+1))/2)
        let cardWidth : CGFloat = self.view.frame.size.width / (CARDNUMBER + 1)
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
            self.view.addSubview(CardViewer[i])
        }
    }
}
