//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 양준혁 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    var stackView: UIStackView!
    let cardBackImage = UIImage(named: "card-back")
    var cards = CardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setStackView()
        drawingCardRandomly()
        test()
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
    
    func generateImage() -> UIImageView {
        let width = self.view.bounds.width/8
        let height = self.view.bounds.width/8 * 1.27
        let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        imageView.image = cardBackImage
        return imageView
    }
    
    func drawingCardRandomly() {
        guard let randSuit = Card.Suit.allCases.randomElement()?.rawValue else { return }
        guard let randRank = Card.Rank.allCases.randomElement()?.rawValue else { return }
        print(String(describing: randSuit) + String(describing: randRank))
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
}

