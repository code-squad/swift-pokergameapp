//
//  ViewController.swift
//  CardGameApp
//
//  Created by Elena on 28/10/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var cardsSegment: UISegmentedControl!
    @IBOutlet weak var playerSegment: UISegmentedControl!
    
    //MARK: override
    ///StatusBar 스타일을 lightContent
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let image = UIImage(named: "bg_pattern") else { return }
        self.view.backgroundColor = UIColor(patternImage: image)

        playGame()

    }

    //MARK: private func
    /// 카드 게임
    private func playGame() {
        let gameMode = GameMode.init(rawValue: cardsSegment.selectedSegmentIndex + 1) ?? GameMode.sevenCard
        let userCount = playerSegment.selectedSegmentIndex + 2
        let cardGame = CardGame.init(gameMode: gameMode, players: userCount)

        let _ = showResults(cardGame)
    }
    /// 결과
    func showResults(_ cardGame: CardGame) -> Bool {
        return cardGame.play(card(name: cardStack:), winner)
    }
            self.view.addSubview(imageView)
        }
    }
}
