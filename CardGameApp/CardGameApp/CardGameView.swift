//
//  CardGameView.swift
//  CardGameApp
//
//  Created by Elena on 11/11/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

class CardGameView: UIView {
    
    //MARK: variable
    private var participantsCount = 0
    var subview = [UIView]()

    //MARK: override
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: func
    func reset() {
        self.participantsCount = 0
        for view in subview {
            view.removeFromSuperview()
        }
        self.subview.removeAll()
    }
    
    func returnView() -> [UIView]{
        return subview
    }
    
    func showResults(_ cardGame: CardGame) -> Bool {
        return cardGame.play(card(name: cardStack:), winner)
    }
    
    /// 카드
    func card(name: String, cardStack: String) {
        participantsCount = drawLabel(name: name)

        let cardStackDescription = cardStack.description
        var shape = cardStackDescription.components(separatedBy: ",")
        shape[0].remove(at: shape[0].startIndex)
        shape[shape.count - 1].remove(at: shape[shape.count - 1].index(before: shape[shape.count - 1].endIndex))

        for index in 0..<shape.count {
            let imgShape = shape[index].trimmingCharacters(in: .whitespacesAndNewlines)
            let cardX = Double(10 + 47 * index)
            let cardY = Double(100 + 100 * participantsCount)
            guard let image: UIImage = UIImage(named: imgShape) else { break }

            let imageView = UIImageView(image: image)

            subview.append(imageView)
            imageView.frame = CGRect(x: cardX, y: cardY, width: 50.0, height: 63.5)
        }
    }
    
    /// 이름의 마지막 글자를 보고 숫자를 돌려준다.
    func nameResult(name: String) -> Int {
        participantsCount += 1
        return participantsCount
    }

    /// Label 그리기
    func drawLabel(name: String) -> Int {
        let number = nameResult(name: name)

        let label = UILabel(frame: CGRect(x: 10, y: 80 + number * 100, width: 200, height: 21))
        label.text = name
        label.textColor = UIColor.white
        subview.append(label)
        return number
    }

    /// 메달 주기
    func winner(name: String) {
        let number = winnerNameNumber(name:name)
        let cardX = Double(10 + 47 * 7 + 20)
        let cardY = Double(100 + 100 * number)
        guard let image: UIImage = UIImage(named: "gold-medal") else { return }
        let imageView = UIImageView(image: image)

        subview.append(imageView)
        imageView.frame = CGRect(x: cardX, y: cardY, width: 50.0, height: 50.0)
    }
    
    /// 기존에 이긴사람 이름을 String으로 받아서, 해당 위치에 메달을 주기 위해서 위치를 구하기 위해 만들었다.
    func winnerNameNumber(name: String) -> Int{
        let lastCharIndex = name.index(before: name.endIndex)
        let lastIndexString = name[lastCharIndex]

        var nameNumber = 0
        if lastIndexString == "러" {
            nameNumber = participantsCount
        }else {
            nameNumber = Int(String(lastIndexString)) ?? 0
        }
        return nameNumber
    }
}
