//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 김지선 on 2021/02/16.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackground()
        placeCards()
        
        let testCard = Card(suit: .spade, rank: .A)
        print(testCard)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setBackground(){
        let backgraoundPattern = UIImage(named: "bg_pattern") ?? UIImage()
        self.view.backgroundColor = UIColor(patternImage: backgraoundPattern)
    }
    
    private func placeCards(){
        let stackView = UIStackView()
        self.view.addSubview(stackView)
        
        let cardNumber = 7
        let cardWidth = self.view.frame.size.width / CGFloat(cardNumber)
        let cardHeight = cardWidth * 1.27
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
    
        for _ in 0..<cardNumber {
            stackView.addArrangedSubview(getCard())
        }

        stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: cardHeight).isActive = true
    }
    
    private func getCard() -> UIImageView {
        return UIImageView(image: UIImage(named: "card-back") ?? UIImage())
    }
}

// Card가 아직은 상속되지 않을 것이라고 판단되어 구조체로 선언하였다.
// 정해진 출력형식을 지정하기 위해 CustomStringConvertible 프로토콜을 상속하였다.
// suit와 number은 고유의 값들을 가지기에 보다 작관적인 표현을 위해 enum을 사용하였다.
struct Card: CustomStringConvertible {
    let suit: Suit
    let rank: Rank
    
    var description: String {
        return "\(suit.rawValue) \(rank.rawValue)"
    }
    
    enum Suit: String {
        case spade = "♠️", club = "♣️", heart = "❤️", diamond = "♦️"
    }
    
    enum Rank: Int {
        case one = 1, three, four, five, six, seven, eight, nine, ten, eleven, tweleve, thirteen
        case J, K, Q, A

        var value: String {
            switch self.rawValue {
            case 1:
                return "A"
            case 11:
                return "J"
            case 12:
                return "Q"
            case 13:
                return "K"
            default:
                return String(self.rawValue)
            }
        }
    }
}


