//
//  ViewController.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gameView: UIView!
    
    private var game = PokerGame(rule: .sevenCardStud, seat: .two)

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        startGame()
    }
    
    private func setBackground() {
        guard let tile = UIImage(named: "bg_pattern.png") else { return }
        view.backgroundColor = UIColor(patternImage: tile)
    }
    
    private func startGame() {
        game.start()
        
        let (players, stacks) = game.info()
        updateView(with: players, stacks)
    }
    
    private func updateView(with players: [String],_ cards: [[Card]]) {
        
        gameView.subviews.forEach { (view) in
            view.removeFromSuperview()
        }

        for (i, player) in players.enumerated() {
            addCardView(with: player, cards[i], location: i)
        }
    }
    
    private func addCardView(with player: String,_ cards: [Card], location: Int) {
        
        let cardCnt = cards.count
        let countInCGF = CGFloat(cards.count)

        let viewSize = (width: gameView.bounds.width, height: gameView.bounds.height)
        let marginRatio: CGFloat = 0.1, cardRatio: CGFloat = 1.27
        let weight: CGFloat = cardCnt == 5 ? 2.2 : 2

        let marginUp = viewSize.height * marginRatio * CGFloat(location) * weight
        let marginRL = viewSize.width / countInCGF * marginRatio

        let cardWidth = (viewSize.width + marginRL * (countInCGF + 1)) / countInCGF
        let cardHeight = cardWidth * cardRatio

        for i in 0..<cardCnt {
            let card = UIImage(named: "\(cards[i]).png")
            let cardView = UIImageView(image: card)
            
            cardView.frame = CGRect(x: cardWidth * CGFloat(i) - marginRL * (CGFloat(i) + 1),
                                    y: marginUp,
                                    width: cardWidth,
                                    height: cardHeight)
            gameView.addSubview(cardView)
        }
        
        let labelY = marginUp + cardHeight
        addLabel(of: player, to: labelY)
    }
    
    private func addLabel(of player: String, to labelY: CGFloat) {
        let label = UILabel(frame: CGRect(x: 0,
                                          y: labelY,
                                          width: 80,
                                          height: 30))
        label.text = player
        label.textColor = .white
        gameView.addSubview(label)
    }
}

//MARK: - Event 관련
extension ViewController {
    @IBAction func ruleSegmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            game.changeRule(to: .sevenCardStud)
        case 1:
            game.changeRule(to: .fiveCardStud)
        default:
            break
        }
        startGame()
    }
    
    @IBAction func seatSegmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            game.changeSeat(to: .two)
        case 1:
            game.changeSeat(to: .three)
        case 2:
            game.changeSeat(to: .four)
        default:
            break
        }
        startGame()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            startGame()
        }
    }
}
