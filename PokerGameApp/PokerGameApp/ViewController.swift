//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    let gameOperator = GameOperator()
    let players = Players()
    let verticalStackView = UIStackView()
    private var playerInfo = [Player]()
    
    @IBAction func studChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            gameOperator.stud = 7
            restartGame(playerNum: gameOperator.num, cardStud: gameOperator.stud)
        } else if sender.selectedSegmentIndex == 1 {
            gameOperator.stud = 5
            restartGame(playerNum: gameOperator.num, cardStud: gameOperator.stud)
        }
    }
    
    @IBAction func numChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            gameOperator.num = 1
            restartGame(playerNum: gameOperator.num, cardStud: gameOperator.stud)
        } else if sender.selectedSegmentIndex == 1 {
            gameOperator.num = 2
            restartGame(playerNum: gameOperator.num, cardStud: gameOperator.stud)
        } else if sender.selectedSegmentIndex == 2 {
            gameOperator.num = 3
            restartGame(playerNum: gameOperator.num, cardStud: gameOperator.stud)
        } else if sender.selectedSegmentIndex == 3 {
            gameOperator.num = 4
            restartGame(playerNum: gameOperator.num, cardStud: gameOperator.stud)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage()
        startGame()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        restartGame(playerNum: gameOperator.num, cardStud: gameOperator.stud)
    }
    
}

// Game Play
extension ViewController {
    
    private func startGame() {
        playerInfo = gameOperator.retrieveInfo()
        addVerticalStackView()
    }
    
    private func restartGame(playerNum: Int, cardStud: Int) {
        verticalStackView.subviews.forEach{ $0.removeFromSuperview() }
        gameOperator.resetGame()
        playerInfo.removeAll()
        gameOperator.startGame(playerNum: playerNum, cardStud: cardStud)
        startGame()
    }
    
}

// View
extension ViewController {
    
    private func setBackgroundImage() {
        if let backgorundImage = UIImage(named: "bg_pattern.png") {
            self.view.backgroundColor = UIColor(patternImage: backgorundImage)
        }
    }
    
    private func makeCardImageView(card: Card) -> UIImageView {
        let cardUIImageView = UIImageView()
        cardUIImageView.image = UIImage(named: "\(stringConverter(card: card)).png")
        cardUIImageView.heightAnchor.constraint(equalTo: cardUIImageView.widthAnchor, multiplier: 1.27).isActive = true
        return cardUIImageView
    }
    
    private func makeCardStackView(playerIndex: Int) -> UIStackView {
        let cardUIStackView = UIStackView()
        cardUIStackView.axis = .horizontal
        cardUIStackView.distribution = .fillEqually
        cardUIStackView.alignment = .fill
        cardUIStackView.spacing = 5
        cardUIStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardUIStackView)
        
        for i in 0..<playerInfo[playerIndex].hand.count {
            let cardUIImageView = makeCardImageView(card: playerInfo[playerIndex].hand[i])
            cardUIStackView.addArrangedSubview(cardUIImageView)
        }
        
        return cardUIStackView
    }
    
    private func makeUILabelView(name: String) -> UILabel {
        let playerUILabel = UILabel()
        playerUILabel.text = name
        playerUILabel.textColor = .white
        playerUILabel.font = UIFont.boldSystemFont(ofSize: 20)
        playerUILabel.textAlignment = .left
        return playerUILabel
    }
    
    private func makeVerticalStackView() -> UIStackView {
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .equalSpacing
        verticalStackView.alignment = .fill
        verticalStackView.spacing = 10
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        return verticalStackView
    }
    
    private func addVerticalStackView() {
        let verticalStackView = makeVerticalStackView()
        for i in 0..<playerInfo.count {
            view.addSubview(verticalStackView)
            verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100 + CGFloat(i) * 100).isActive = true
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
            verticalStackView.addArrangedSubview(makeUILabelView(name: playerInfo[i].name))
            verticalStackView.addArrangedSubview(makeCardStackView(playerIndex: i))
        }
    }
    
}

// Converter: Card Value to Image File Name
extension ViewController {
    
    func stringConverter(card: Card) -> String {
        var cardName = String()
        
        switch card.shape {
        case .spades:
            cardName.append("s")
        case .clubs:
            cardName.append("c")
        case .diamonds:
            cardName.append("d")
        case .hearts:
            cardName.append("h")
        }
        
        switch card.num {
        case .eleven:
            cardName.append("J")
        case .twelve:
            cardName.append("Q")
        case .thirteen:
            cardName.append("K")
        case .one:
            cardName.append("A")
        default:
            cardName.append("\(card.num)")
        }
        
        return cardName
    }
    
}


