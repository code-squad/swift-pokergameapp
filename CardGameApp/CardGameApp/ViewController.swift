//
//  ViewController.swift
//  CardGameApp
//
//  Created by Elena on 28/10/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: value
    var subviews = [UIView]()
    var flag = true
    var number = 0

    //MARK: IBOutlet
    @IBOutlet weak var cardsSegment: UISegmentedControl!
    @IBOutlet weak var playerSegment: UISegmentedControl!

    //MARK: IBAction
    @IBAction func changeSegment(_ sender: Any) {
        self.flag = true
        self.number = 0
        deleteView()
        playGame()
    }

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

    //MARK: func
    /// view 삭제
    func deleteView() {
        for view in subviews {
            view.removeFromSuperview()
        }
    }
      
    /// 결과
    func showResults(_ cardGame: CardGame) -> Bool {
        return cardGame.play(card(name: cardStack:), winner)
    }

    /// 카드
    func card(name: String, cardStack: String) {
        number = drawLabel(name: name)

        let cardStackDescription = cardStack.description
        var shape = cardStackDescription.components(separatedBy: ",")
        shape[0].remove(at: shape[0].startIndex)
        shape[shape.count - 1].remove(at: shape[shape.count - 1].index(before: shape[shape.count - 1].endIndex))

        for index in 0..<shape.count {
            let imgShape = shape[index].trimmingCharacters(in: .whitespacesAndNewlines)
            let cardX = Double(10 + 47 * index)
            let cardY = Double(100 + 100 * number)
            guard let image: UIImage = UIImage(named: imgShape) else { break }

            let imageView = UIImageView(image: image)

            self.view.addSubview(imageView)
            imageView.frame = CGRect(x: cardX, y: cardY, width: 50.0, height: 63.5)
            subviews.append(imageView)
        }
    }
    
    /// 이름의 마지막 글자를 보고 숫자를 돌려준다.
    func nameResult(name: String) -> Int {
        let lastCharIndex = name.index(before: name.endIndex)
        let lastIndexString = name[lastCharIndex]
        
        var nameNumber = 0
        if lastIndexString == "러" {
            nameNumber = playerSegment.selectedSegmentIndex + 3
        } else {
            nameNumber = Int(String(lastIndexString)) ?? 0
        }
        
        return nameNumber
    }

    /// Label 그리기
    func drawLabel(name: String) -> Int {
        let number = nameResult(name: name)

        let label = UILabel(frame: CGRect(x: 10, y: 80 + number * 100, width: 200, height: 21))
        label.text = name
        label.textColor = UIColor.white
        self.view.addSubview(label)
        subviews.append(label)
        return number
    }

    /// 메달 주기
    func winner(name: String) {
        let number = nameResult(name: name)
        let cardX = Double(10 + 47 * 7 + 20)
        let cardY = Double(100 + 100 * number)
        guard let image: UIImage = UIImage(named: "gold-medal") else { return }
        let imageView = UIImageView(image: image)

        self.view.addSubview(imageView)
        imageView.frame = CGRect(x: cardX, y: cardY, width: 50.0, height: 50.0)
        subviews.append(imageView)
    }
}
