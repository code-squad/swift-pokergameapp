//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    var stackView: UIStackView!
    var gameTypeStackView: UIStackView!
    var playerStackView: UIStackView!
    let cardBackImage = UIImage(named: "card-back")
    var cards = CardDeck(cards: [])
    let sevenStudButton = UIButton()
    let fiveStudButton = UIButton()
    let TwoPlayerButton = UIButton()
    let ThreePlayerButton = UIButton()
    let FourPlayerButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        testPoker()
        selectGameTypeButton()
        selectPlayerButton()
    }
   
    func setBackground() {
        guard let bgImage = UIImage(named: "bg_pattern") else { return }
        self.view.backgroundColor = UIColor(patternImage: bgImage)
    }
    
    func setStackView() {
        self.stackView = UIStackView()
        self.stackView.axis = .horizontal
        self.stackView.alignment = .fill
        self.stackView.distribution = .equalSpacing
        self.stackView.spacing = 5
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        for _ in 0...6 {
            self.stackView.addArrangedSubview(generateImage())
        }
        
        self.view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    }
    
    func selectGameTypeButton() {
        sevenStudButton.setTitle("7 Cards", for: .normal)
        sevenStudButton.layer.borderColor = UIColor.white.cgColor
        sevenStudButton.layer.borderWidth = 1
        fiveStudButton.setTitle("5 Cards", for: .normal)
        fiveStudButton.layer.borderColor = UIColor.white.cgColor
        fiveStudButton.layer.borderWidth = 1
        sevenStudButton.setBackgroundColor(.clear, for: .normal)
        sevenStudButton.setBackgroundColor(.white, for: .selected)
                
        self.gameTypeStackView = UIStackView()
        self.gameTypeStackView.axis = .horizontal
        self.gameTypeStackView.alignment = .fill
        self.gameTypeStackView.distribution = .fillEqually
        self.gameTypeStackView.translatesAutoresizingMaskIntoConstraints = false
        
        gameTypeStackView.addArrangedSubview(sevenStudButton)
        gameTypeStackView.addArrangedSubview(fiveStudButton)
        
        self.view.addSubview(gameTypeStackView)
        
        gameTypeStackView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        gameTypeStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        gameTypeStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

    }
    
    func selectPlayerButton() {
        TwoPlayerButton.setTitle("2명", for: .normal)
        TwoPlayerButton.layer.borderColor = UIColor.white.cgColor
        TwoPlayerButton.layer.borderWidth = 1
        ThreePlayerButton.setTitle("3명", for: .normal)
        ThreePlayerButton.layer.borderColor = UIColor.white.cgColor
        ThreePlayerButton.layer.borderWidth = 1
        FourPlayerButton.setTitle("4명", for: .normal)
        FourPlayerButton.layer.borderColor = UIColor.white.cgColor
        FourPlayerButton.layer.borderWidth = 1
        
        self.playerStackView = UIStackView()
        self.playerStackView.axis = .horizontal
        self.playerStackView.alignment = .fill
        self.playerStackView.distribution = .fillEqually
        self.playerStackView.translatesAutoresizingMaskIntoConstraints = false
        playerStackView.addArrangedSubview(TwoPlayerButton)
        playerStackView.addArrangedSubview(ThreePlayerButton)
        playerStackView.addArrangedSubview(FourPlayerButton)
        self.view.addSubview(playerStackView)
        
        playerStackView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        playerStackView.topAnchor.constraint(equalTo: gameTypeStackView.bottomAnchor, constant: 10).isActive = true
        playerStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func generateImage() -> UIImageView {
        let width = self.view.bounds.width/8
        let height = self.view.bounds.width/8 * 1.27
        let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        imageView.image = cardBackImage
        return imageView
    }

    func testPoker() {
        let pokergame = PokerGame(players: Players(participant: .four), dealer: Dealer(gameType: .seven))
        pokergame.startGame()
        pokergame.printParticipantCards()
    }

}

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
        
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
         
        self.setBackgroundImage(backgroundImage, for: state)
    }
}
