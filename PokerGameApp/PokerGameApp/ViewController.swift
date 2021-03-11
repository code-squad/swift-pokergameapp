//
//  ViewController.swift
//  PokerGameApp
//
//  Created by jinseo park on 3/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        /*백그라운드 디자인 패턴 이미지*/
        guard let patternImg = UIImage(named: "bg_pattern.png") else { return }
        self.view.backgroundColor = UIColor(patternImage: patternImg)
        
        /*참조 영상 : https://www.youtube.com/watch?v=zpb4-VnaaqQ */
        /*카드 스택 뷰 옵션 설정. */
        cardStackView.distribution = .fillEqually
        cardStackView.spacing = 10
        
        
        /*이미지 뷰 배열을 설정*/
        var cardImgViewArr : [UIImageView] = []
            
        /*7개의 카드 이미지 뷰를 생성과 동시에 해당 이미지를 스택에 추가한다.
         또한 각 이미지뷰의 옵션도 설정함.
         */
        for index in 0 ..< 7 {
            cardImgViewArr.append(UIImageView(image: UIImage(named: "card-back.png")))
            
            cardStackView.addArrangedSubview(cardImgViewArr[index])
            
            cardImgViewArr[index].contentMode = .scaleAspectFit
            cardImgViewArr[index].clipsToBounds = true
            
            
        }
        
    }
}

