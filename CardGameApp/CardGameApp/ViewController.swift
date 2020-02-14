//
//  ViewController.swift
//  CardGameApp
//
//  Created by jinie on 2020/02/11.
//  Copyright © 2020 jinie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        let blackjackCard = BlackjackCard(suit: BlackjackCard.Suit(rawValue: "♥️"), rank: BlackjackCard.Rank(rawValue: 12))
        blackjackCard.printCard()
    }
    
    /*
     - 카드 특성상 모양과 숫자의 모든 case를 알고 있고, 추가, 변경, 삭제되지 않으므로 열거형으로 정의
     - 숫자의 경우 첫 번째 case에 Int 타입의 rawValue를 설정하여 1씩 증가시키기 편리함
     - 정의한 타입이 카드에 내포되는 것을 파악하기 쉽도록 중첩하여 구현
     */
    private struct BlackjackCard {
        enum Suit: Character {
            case spades = "♠️", hearts = "♥️", diamonds = "♦️", clubs = "♣️"
        }

        enum Rank: Int {
            case one = 1, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen
        }

        let suit: Suit?, rank: Rank?

        func printCard() {
            var output = ""
            if let suit = suit {
                output += String(suit.rawValue)
            }
            if let rank = rank {
                let rankValue = rank.rawValue
                if rankValue == 1 || rankValue > 10 {
                    let ranks = [1: "A", 11: "J", 12: "Q", 13: "K"]
                    output += ranks[rankValue]!
                } else {
                    output += String(rankValue)
                }
            }
            print(output)
        }
    }
    
    private func specifiedStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func makeCardViews() -> UIStackView {
        let stackView = specifiedStackView()
        
        for _ in 0..<7 {
            let cardView = UIImageView(image: UIImage(named: "card-back"))
            stackView.addArrangedSubview(cardView)
            cardView.heightAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 1.27).isActive = true
        }
        
        return stackView
    }
    
    private func setView() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern")!)
        
        let stackView = makeCardViews()
        self.view.addSubview(stackView)
        let constraints = [
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50.0)
        ]
        NSLayoutConstraint.activate(constraints)
    }

}
