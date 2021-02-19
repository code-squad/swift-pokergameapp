//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 박혜원 on 2021/02/15.
//

import UIKit

class CardViewController: UIViewController {
    
    static let cardCount : Int = 7 // 카드의 개수
    static let aspectRatio : CGFloat = 1.27 // 카드의 가로 세로 비율
    static let padding : CGFloat = (CGFloat(cardCount)-1) // 카드의 간격의 갯수 (7개의 카드이므로 간격은 6번존재)
    
    let cardBackImage : UIImage = {
        return UIImage(named: "cardback.png") ?? UIImage()
    }()
    
    let backgroundImagePattern : UIImage = {
        return UIImage(named: "bg_pattern") ?? UIImage()
    }()

    let segmentControlForCards = UISegmentedControl(items: ["5 Cards", "7 Cards"])
    let segmentControlForPlayers = UISegmentedControl(items: ["2명", "3명", "4명"])
    
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        
        let pokergame = PokerGame(participants: .three, cardSqud: .seven)
        pokergame.start()
        
        configureStackView()
        addCardsStackView()
        configureSegmentControl()
    }
    
    func setBackgroundColor(){
        self.view.backgroundColor = UIColor(patternImage: backgroundImagePattern)
    }
    
    func addCardsStackView(){
        let cardCount = 7

        for _ in 0..<cardCount {
            let cardImageView = getCardImageView()
            stackView.addArrangedSubview(cardImageView)
        }
    }
    
    func getCardImageView() -> UIImageView{
        
        let imageView = UIImageView()
        imageView.image = cardBackImage
        imageView.contentMode = .scaleAspectFit

        return imageView
    }
    
    // MARK: Configuration
    
    func configureStackView(){
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        setStackViewConstraints()
    }

    func configureSegmentControl(){
        view.addSubview(segmentControlForCards)
        view.addSubview(segmentControlForPlayers)
        
        setSegmentControlForCardsConstraints()
        setSegmentControlForPlayersConstraints()
    }
    
    // MARK: Constraints
    
    // Cards segmentControl : 가장 위에 그려짐
    func setSegmentControlForCardsConstraints(){
        segmentControlForCards.translatesAutoresizingMaskIntoConstraints = false
        segmentControlForCards.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        segmentControlForCards.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        segmentControlForCards.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
    }
    // Player SegmentControl : Card segmentControl 밑에 그려짐
    func setSegmentControlForPlayersConstraints(){
        segmentControlForPlayers.translatesAutoresizingMaskIntoConstraints = false
        segmentControlForPlayers.topAnchor.constraint(equalTo: segmentControlForCards.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        segmentControlForPlayers.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        segmentControlForPlayers.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
    }
    // StackView : Player Segment Control 밑에 그려짐
    func setStackViewConstraints(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true // 수정할 것
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
//        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
    }
}

