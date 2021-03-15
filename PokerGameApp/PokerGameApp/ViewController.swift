//
//  ViewController.swift
//  PokerGameApp
//
//  Created by jinseo park on 3/11/21.
//

import UIKit

/* 하드코딩을 대체하기 위한 상수 선언 */
fileprivate let ZERO : Int = 0
fileprivate let NUMBER_CARD : Int = 7
fileprivate let STACKVIEW_SPACING : CGFloat = 10
fileprivate let CARD_IMAGE_PATH : String = "bg_pattern.png"


class ViewController: UIViewController {

    @IBOutlet weak var cardStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        /*백그라운드 디자인 패턴 이미지*/
        
        func makeStackView() {
            guard let patternImg = UIImage(named: CARD_IMAGE_PATH) else { return }
            self.view.backgroundColor = UIColor(patternImage: patternImg)
            
            /*참조 영상 : https://www.youtube.com/watch?v=zpb4-VnaaqQ */
            /*카드 스택 뷰 옵션 설정. */
            cardStackView.distribution = .fillEqually
            cardStackView.spacing = STACKVIEW_SPACING
                    
            
        }
       
        /*이미지 뷰 배열 생성 및 설정*/
        func arrangeImgViewToStackView() {
            var cardImgViewArr : [UIImageView] = []
            /*
             7개의 카드 이미지 뷰를 생성과 동시에 해당 이미지를 스택에 추가한다.
             또한 각 이미지뷰의 옵션도 설정함.
             */
            for index in ZERO ..< NUMBER_CARD {
                cardImgViewArr.append(UIImageView(image: UIImage(named: "card-back.png")))
                
                cardStackView.addArrangedSubview(cardImgViewArr[index])
                
                cardImgViewArr[index].contentMode = .scaleAspectFit
                cardImgViewArr[index].clipsToBounds = true

            }
        }
        
        makeStackView()
        arrangeImgViewToStackView()
        
        /*Step2 콘솔 표현*/
        
        let spadeAce = Spade(NumberOfCard(rawValue: "2")!)
        let heartJack = Heart(NumberOfCard(rawValue: "K")!)


        print(spadeAce.description)
        print(heartJack.description)

        
    }
}

