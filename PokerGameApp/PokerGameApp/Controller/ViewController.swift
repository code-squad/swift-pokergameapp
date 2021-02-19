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
    let cardBackImage = UIImage(named: "card-back")
    var cards = CardDeck(cards: [])
    let sevenStudButton = UIButton()
    let fiveStudButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
//        setStackView()
        testPoker()
        selectGameTypeButton()
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
        self.gameTypeStackView.distribution = .fill
        self.gameTypeStackView.translatesAutoresizingMaskIntoConstraints = false
        
        gameTypeStackView.addArrangedSubview(sevenStudButton)
        gameTypeStackView.addArrangedSubview(fiveStudButton)
        
        self.view.addSubview(gameTypeStackView)
        
        gameTypeStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        gameTypeStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
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
    
    func drawCardRandomly() {
        cards.filltheCardDeck()
        let card = cards.removeOne()
        print(card)
    }
    
    func printDeckReset() {
        cards.reset()
        print("카드 전체를 초기화했습니다.")
        print("총 \(cards.countOfCards())장의 카드가 남아있습니다.")
    }
    func printDeckShuffle() {
        cards.shuffle()
        print("전체 \(cards.countOfCards())장의 카드를 섞었습니다.")
    }
    func printDeckRemoveOne() {
        print(cards.removeOne())
        print("총 \(cards.countOfCards())장의 카드가 남아있습니다.")
    }
    func test() {
        printDeckReset()
        printDeckShuffle()
        printDeckRemoveOne()
        printDeckRemoveOne()
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
