//
//  ViewController.swift
//  CardGameApp
//
//  Created by Elena on 28/10/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: variable
    var cardGameView = CardGameView()
    private let bg_pattern = "bg_pattern"

    //MARK: IBOutlet
    @IBOutlet weak var cardsSegment: UISegmentedControl!
    @IBOutlet weak var playerSegment: UISegmentedControl!

    //MARK: IBAction
    @IBAction func changeSegment(_ sender: Any) {
        cardGameView.reset()
        setCardGameView()
    }

    //MARK: override
    ///StatusBar 스타일을 lightContent
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        self.becomeFirstResponder()
        setSegmented()
        setCardGameView()
    }
    
    /// 사용자 Shake 이벤트를 발생
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    /// Shake 종료시 호출
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            cardGameView.reset()
            setCardGameView()
        }
    }
    
    //MARK: private func
    /// 배경 설정
    private func setBackground() {
        guard let image = UIImage(named: bg_pattern) else { return }
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    
    /// UISegmentedControl 설정
    private func setSegmented() {
        cardsSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .selected)
        cardsSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        playerSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .selected)
        playerSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
    }
    
    /// 카드게임 시작
    private func setCardGameView() {
        let gameMode = GameMode.init(rawValue: cardsSegment.selectedSegmentIndex + 1) ?? GameMode.sevenCard
        let userCount = playerSegment.selectedSegmentIndex + 2
        let cardGame = CardGame.init(gameMode: gameMode, players: userCount)

        let _ = cardGameView.showResults(cardGame)
        
        for view in cardGameView.returnView() {
            self.view.addSubview(view)
        }
    }
}
