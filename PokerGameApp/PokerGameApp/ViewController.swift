//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 이다훈 on 2021/02/16.
//

import UIKit

class ViewController: UIViewController {
    let cardBacksideImage = UIImage(named: "card-back")
    let trouble = TroubleShooter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        do{
            self.view.backgroundColor = UIColor(patternImage: try optionalBindingBGImage())
        }
        catch {
            print(error)
            present(trouble.fatalError(), animated: true, completion: nil)
            //UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
        }
        
        for _ in 0..<7 {
            self.view.addSubview(backsideOfCard())
        }
    }
    
    private func optionalBindingBGImage() throws -> UIImage {
        guard let image = UIImage(named: "bg_pattern") else {
            throw TroubleShooter.errors.optionalBindingError
        }
        return image
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    func backsideOfCard() -> UIImageView {
        
        let cardBackSideWidth : CGFloat = (view.bounds.width - 80)/7  //214
        let cardBackSideHeight : CGFloat = cardBackSideWidth * 1.27
        
        let downPosX: CGFloat = 10 + CGFloat(self.view.subviews.count ) * (cardBackSideWidth + 10)
        let downPosY: CGFloat = 50
        
        let imageView: UIImageView = UIImageView(frame: CGRect(x: downPosX, y: downPosY, width: cardBackSideWidth, height: cardBackSideHeight))
        imageView.image = self.cardBacksideImage

        return imageView
    }
}

