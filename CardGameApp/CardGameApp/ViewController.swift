//
//  ViewController.swift
//  CardGameApp
//
//  Created by Keunna Lee on 2020/02/08.
//  Copyright © 2020 Keunna Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   var pokerGame = PokerGame(numbersOfPlayers: .two, gameMode: .fiveCardStud)
    
    // MARK: - Properties
    // StackView
    let cardsStack: UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.spacing = 4
        
        return horizontalStackView
    }()
    
    // [추가한 부분] - 참여한 플레이어들의 카드가 쌓이는 StackView
    let playersCardsStackView: UIStackView = {
        let playersCardsStackView = UIStackView()
        playersCardsStackView.translatesAutoresizingMaskIntoConstraints = false
        playersCardsStackView.axis = .vertical
        playersCardsStackView.distribution = .fillEqually
        playersCardsStackView.spacing = 4
        
        return playersCardsStackView
    }()
    
    // SegmentedControl
    // - GameMode
    let gameMode: [String] = ["7 Cards", "5 Cards"]
    
    lazy var gameModeSegmentControl: UISegmentedControl = {
        let gameModeSegmentControl: UISegmentedControl = UISegmentedControl(items: gameMode)
        
        gameModeSegmentControl.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/12)
        gameModeSegmentControl.backgroundColor = UIColor.gray
        gameModeSegmentControl.tintColor = UIColor.white
        gameModeSegmentControl.addTarget(self, action:
            #selector(gameModeSegmentChanged(segmentedControl:)),
                                         for: .valueChanged)
        gameModeSegmentControl.selectedSegmentIndex = 0
        return gameModeSegmentControl
    }()
    
    // - Players
    let numbersOfPlayers: [String] = ["2명", "3명", "4명"]
    
    lazy var numbersOfPlayersSegmentControl: UISegmentedControl = {
        let numbersOfPlayersSegmentControl: UISegmentedControl = UISegmentedControl(items: numbersOfPlayers)
        numbersOfPlayersSegmentControl.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/7-10)
        numbersOfPlayersSegmentControl.backgroundColor = UIColor.gray
        numbersOfPlayersSegmentControl.tintColor = UIColor.white
        numbersOfPlayersSegmentControl.addTarget(self, action:
            #selector(numbersOfPlayersSegmentChanged(segmentedControl:)),
                                                 for: .valueChanged)
        numbersOfPlayersSegmentControl.selectedSegmentIndex = 0
        return numbersOfPlayersSegmentControl
        
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage:  #imageLiteral(resourceName: "bg_pattern"))
        
        //StakcView - 카드 뒷면
        addCards()
        self.view.addSubview(cardsStack)
        setStackView ()
        //UISegmentedControl - 게임 모드 선택
        self.view.addSubview(self.gameModeSegmentControl)
        //UISegmentedControl - 플레이어 인원 선택
        self.view.addSubview(self.numbersOfPlayersSegmentControl)
    }
    
    // MARK: - Configuration
    // StackView
    func setStackView() {
        cardsStack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 140).isActive = true
        cardsStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
        cardsStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
    }
    
    // StackView에 넣을 이미지 뷰 생성
    func makeCard() -> UIImageView {
        let card = UIImageView(image:  #imageLiteral(resourceName: "card-back"))
        card.contentMode = .scaleAspectFit
        card.heightAnchor.constraint(equalTo: card.widthAnchor, multiplier: 1.27).isActive = true
        return card
    }
    
    func addCards() {
        for _ in 0 ..< 7 {
            cardsStack.addArrangedSubview(makeCard())
        }
    }
//
//    func makeCardDeck() -> [UIImageView] {
//        for card in 1 ... 7 {
//            GameMode.setCardPlacement({
//
//            })
//            CardDeck.pickCard()
//        }
//    }
//
//    func makePlayersCards() -> UIImageView {
//        let card = UIImageview(image: # #imageLiteral(resourceName: "card-back"))
//        // 랜덤하게 카드를 받아오려면 CardDeck에세 카드를 랜덤하게 뽑아와야하는데
//        // 그럴려면 CardDeck에 이미지를 갖고있는 랜덤한 카드가 세팅되어있어야 하지 않을까?
//
//        return card
//    }
    
    func addPlayers() {
        for _ in 2 ... 4 {
            playersCardsStackView.addArrangedSubview(makeCard())
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // SegmentedControl
    @objc func gameModeSegmentChanged(segmentedControl: UISegmentedControl){
        // 게임 모드 선택에 따른 내용 구현 예정
        switch segmentedControl.selectedSegmentIndex {
        //        case 0: // 5 cards
        //        case 1: // 7 cards
        default: return
        }
    }
    
    @objc func numbersOfPlayersSegmentChanged(segmentedControl: UISegmentedControl){
        // 플레이어 인원 선택에 따른 내용 구현 예정
        switch segmentedControl.selectedSegmentIndex {
            //        case 0: // 1 명
            //        case 1: // 2 명
            //        case 2: // 3 명
        //        case 3: // 4 명
        default: return
        }
    }
    
    func setSegmentedControl() {
        // 추후 추가 예정
    }
}
