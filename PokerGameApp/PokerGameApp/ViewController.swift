//
//  ViewController.swift
//  PokerGameApp
//
//  Created by sonjuhyeong on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cardStudSegment: UISegmentedControl!
    @IBOutlet weak var playerCountSegment: UISegmentedControl!
    
    var cardStud: PokerGame.CardStud = .seven
    var playerCount: PokerGame.PlayerCount = .four
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBackGround()
        makeVerticalStackView()

        let pokerGame = PokerGame(playerCount: .three, cardStud: .five)
        pokerGame.makeGamePlayer()
        pokerGame.distributeCard()
        print(pokerGame)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    // 백그라운드 배경
    func makeBackGround() {
        if let bgImage = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = .init(patternImage: bgImage)
        }
    }
    
    // 카드 이미지 뷰
    func makeCardImageView() -> UIImageView {
        let cardImageView = UIImageView()
        let image = UIImage(named: "cA")
        cardImageView.image = image
        cardImageView.widthAnchor.constraint(equalTo: cardImageView.heightAnchor, multiplier: 1.0/1.27).isActive = true
        return cardImageView
    }
    
    // 카드 이미지 뷰를 가지고 있는 스택 뷰
    func makeCardStackView() -> UIStackView {
        let cardStackView = UIStackView()
        cardStackView.axis = .horizontal
        cardStackView.distribution = .fillEqually
        cardStackView.alignment = .fill
        
        cardStackView.spacing = -10
        cardStackView.translatesAutoresizingMaskIntoConstraints = false
        for _ in 0..<cardStud.rawValue {
            cardStackView.addArrangedSubview(makeCardImageView())
        }
        return cardStackView
    }
    
    // 플레이어 라벨을 가지고 있는 스택 뷰
    func makeLabelStackView(text: String) -> UIStackView {
        let nameStackView = UIStackView()
        nameStackView.axis = .vertical
        nameStackView.alignment = .fill
        nameStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let nameLabel = UILabel()
        nameLabel.text = text
        nameLabel.textColor = .white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameStackView.addArrangedSubview(nameLabel)
        return nameStackView
    }
    
    // 라벨 스택 뷰, 카드 스택 뷰를 가지고 있는 큰 스택 뷰
    func makeVerticalStackView() {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .top
        verticalStackView.spacing = 5
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(verticalStackView)
        verticalStackView.topAnchor.constraint(equalTo: playerCountSegment.bottomAnchor, constant: 20).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        for num in 0..<playerCount.rawValue {
            verticalStackView.addArrangedSubview(makeLabelStackView(text: "Player\(num+1)"))
            verticalStackView.addArrangedSubview(makeCardStackView())
        }
        verticalStackView.addArrangedSubview(makeLabelStackView(text: "Dealer"))
        verticalStackView.addArrangedSubview(makeCardStackView())
    }
    
    @IBAction func changeCardStud(_ sender: Any) {
        switch cardStudSegment.selectedSegmentIndex {
        case 0:
            cardStud = .seven
        case 1:
            cardStud = .five
        default:
            break
        }
    }
    
    @IBAction func changePlayerCount(_ sender: Any) {
        switch playerCountSegment.selectedSegmentIndex {
        case 0:
            playerCount = .two
        case 1:
            playerCount = .three
        case 2:
            playerCount = .four
        default:
            break
        }
    }
}
