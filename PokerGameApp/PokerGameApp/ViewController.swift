//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Jun Ho JANG on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewBoardContents = [[String]]()
    private var cardStud = 7
    private var playersNum = 2
    private var handStackViewArray = [UIStackView]()
    private var verticalStackView = UIStackView()
    private var cardArray = [UIImageView]()
    private var playerLabelArray = [UILabel]()
    
    @IBAction func studChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            cardStud = 7
            restartGame(playersNum: playersNum, cardStud: cardStud)
        } else if sender.selectedSegmentIndex == 1 {
            cardStud = 5
            restartGame(playersNum: playersNum, cardStud: cardStud)
        }
    }
    
    @IBAction func numChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            playersNum = 2
            restartGame(playersNum: playersNum, cardStud: cardStud)
        } else if sender.selectedSegmentIndex == 1 {
            playersNum = 3
            restartGame(playersNum: playersNum, cardStud: cardStud)
        } else if sender.selectedSegmentIndex == 2 {
            playersNum = 4
            restartGame(playersNum: playersNum, cardStud: cardStud)
        } else if sender.selectedSegmentIndex == 3 {
            playersNum = 5
            restartGame(playersNum: playersNum, cardStud: cardStud)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage()
        startGame(playersNum: playersNum, cardStud: cardStud)
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            restartGame(playersNum: playersNum, cardStud: cardStud)
        }
    }
    
}

// Game Playing

extension ViewController {
    
    private func startGame(playersNum: Int, cardStud: Int) {
        let gameOperator = GameOperator()
        gameOperator.startGame(playersNum: playersNum, cardStud: cardStud)
        gameOperator.checkBoard()
        viewBoardContents = gameOperator.gameBoard
        replaceChar()
        print(viewBoardContents)
        makeCardStackView()
        makeVerticalStackView()
        addGameBoardSubview()
    }
    
    private func restartGame(playersNum: Int, cardStud: Int) {
        removeCardView()
        handStackViewArray.removeAll()
        cardArray.removeAll()
        playerLabelArray.removeAll()
        for subview in verticalStackView.subviews {
            subview.removeFromSuperview()
        }
        startGame(playersNum: playersNum, cardStud: cardStud)
    }
    
    
    
}

// View Output
extension ViewController {
    
    private func setBackgroundImage() {
        if let backgorundImage = UIImage(named: "bg_pattern.png") {
            self.view.backgroundColor = UIColor(patternImage: backgorundImage)
        }
    }
    
    func addGameBoardSubview() {
        playerLabelArray[playerLabelArray.endIndex-1].text = "Dealer"
        for i in 0...playersNum {
            verticalStackView.addArrangedSubview(playerLabelArray[i])
            verticalStackView.addArrangedSubview(handStackViewArray[i])
        }
    }
    
    
    private func makeVerticalStackView() {
        for i in 0...playersNum {
            
            verticalStackView.axis = .vertical
            verticalStackView.distribution = .equalSpacing
            verticalStackView.alignment = .fill
            verticalStackView.spacing = 10
            verticalStackView.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(verticalStackView)
            
            verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100 + CGFloat(i) * 100).isActive = true
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
            
            playerLabelArray.append(UILabel())
            playerLabelArray[i].text = "Player \(i+1)"
            playerLabelArray[i].textColor = .white
            playerLabelArray[i].font = UIFont.boldSystemFont(ofSize: 20)
            playerLabelArray[i].textAlignment = .left
            
        }
    }

    private func makeCardStackView() {
        for j in 0...playersNum {
            handStackViewArray.append(UIStackView())
            handStackViewArray[j].axis = .horizontal
            handStackViewArray[j].distribution = .fillEqually
            handStackViewArray[j].alignment = .fill
            handStackViewArray[j].spacing = 5
            handStackViewArray[j].translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(handStackViewArray[j])
            
            for i in 0..<cardStud {
                let cardUIImageView = UIImageView()
                let image = UIImage(named: "\(viewBoardContents[j][i])")
                cardUIImageView.image = image
                cardUIImageView.heightAnchor.constraint(equalTo: cardUIImageView.widthAnchor, multiplier: 1.27).isActive = true
                handStackViewArray[j].addArrangedSubview(cardUIImageView)
            }
        }
    }
    
    private func removeCardView() {
        for i in 0..<handStackViewArray.count {
            handStackViewArray[i].removeFromSuperview()
            
        }
    }
}

// Convert Character to Image File Name
extension ViewController {

    private func replaceChar() {
        for i in 0..<viewBoardContents.count {
            viewBoardContents[i] = viewBoardContents[i].map({$0[$0.startIndex] == "\u{2664}" ? "s\($0[$0.index(after: $0.startIndex)])" : $0})
            viewBoardContents[i] = viewBoardContents[i].map({$0[$0.startIndex] == "\u{2667}" ? "c\($0[$0.index(after: $0.startIndex)])" : $0})
            viewBoardContents[i] = viewBoardContents[i].map({$0[$0.startIndex] == "\u{2662}" ? "d\($0[$0.index(after: $0.startIndex)])" : $0})
            viewBoardContents[i] = viewBoardContents[i].map({$0[$0.startIndex] == "\u{2661}" ? "h\($0[$0.index(after: $0.startIndex)])" : $0})
        }
        for i in 0..<viewBoardContents.count {
            viewBoardContents[i] = viewBoardContents[i].map({$0[$0.index(after: $0.startIndex)] == "1" ? "\($0[$0.startIndex])10" : $0})
        }
    }
    
}

