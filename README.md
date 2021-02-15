# pokergameapp-step1, 2 - 게임판 만들기, 카드덱 구현과 테스트



- 화면 크기에 따라 코드로 View를 생성하고 화면에 추가하는 방식을 학습한다.

- 앱 기본 설정(Info.plist)을 변경하는 방식에 대해 학습한다.





- 데이터를 추상화하기 위한 설계 방식을 학습한다.
- 객체 내부 데이터 타입과 출력할 때 사용할 데이터를 구분해서 사용할 것인지 연습한다.
- 유니코드를 적극 활용한다.









```swift
//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Issac on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pattern = UIImage(named: "bg_pattern.png") {
            self.view.backgroundColor = UIColor(patternImage: pattern)
        }

        let imageStackView = UIStackView()
        createCardInsideStackView(imageStackView)
        configImageStackView(imageStackView)
        self.view.addSubview(imageStackView)
        configConstraintStackView(imageStackView)
        
        
        let cardA = Card(.hearts, .queen)
        let cardB = Card(.spades, .seven)
        print(cardA, cardB)
    }
    
    private func createCardInsideStackView(_ stackView: UIStackView) {
        for _ in 1...7 {
            let image = UIImage(named: "card-back.png")!
            let imageView = UIImageView(image: image)
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = 5
            
            let aspectRatioConstraint = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: (1.27 / 1.0), constant: 0)
            imageView.addConstraint(aspectRatioConstraint)
            stackView.addArrangedSubview(imageView)
        }
        
    }
    
    private func configImageStackView(_ stackView: UIStackView) {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 5
    }
    
    private func configConstraintStackView(_ stackView: UIStackView) {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let margin = self.view.layoutMarginsGuide
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
        stackView.topAnchor.constraint(equalTo: margin.topAnchor, constant: 10).isActive = true
    }
}


```









![1-1](https://user-images.githubusercontent.com/62657991/107908589-bf97ad00-6f99-11eb-9c76-85cf47116db9.png)
![1-2](https://user-images.githubusercontent.com/62657991/107908601-c45c6100-6f99-11eb-8915-164b82094674.png)