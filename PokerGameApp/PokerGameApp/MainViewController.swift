//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/15.
//

import UIKit

class MainViewController: UIViewController {
    // horiziontalStackView 는 여러개 만들어줄 필요가 있으므로 아래 함수에서 따로 구현한다.
    var horizontalStackView: UIStackView!
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .top
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImg()
        var game = PockerGame(number: ParticipantType.three, number: GameType.seven)
        game.gameStart()
        print(game.getDealer())
        
        
        addVerticalStackViewWithConstraints()
        addCardImg(addHorizontalStackView())
        addCardImg(addHorizontalStackView())
        addCardImg(addHorizontalStackView())

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setBackgroundImg() {
        guard let backgroundImg = UIImage(named: "bg_pattern.png") else {
            return
        }
        self.view.backgroundColor = UIColor(patternImage: backgroundImg)
    }
    func addCardImg(_ stackView: UIStackView) {
        self.verticalStackView.addArrangedSubview(stackView)
        for _ in 0..<7 {
            stackView.addArrangedSubview(createImgView(name: "card-back.png"))
        }
    }
    func addVerticalStackViewWithConstraints() {
        self.view.addSubview(verticalStackView)
        verticalStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
    }
    func addHorizontalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.distribution = .fillEqually
        stackView.spacing = -1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }

    func createImgView(name: String) -> UIImageView {
        let imgView = UIImageView()
        imgView.widthAnchor.constraint(equalTo: imgView.heightAnchor, multiplier: 1.0/1.27).isActive = true
        imgView.image = UIImage(named: name)
        return imgView
    }
}

