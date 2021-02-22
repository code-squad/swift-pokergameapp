//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 심영민 on 2021/02/15.
//

import UIKit

class MainViewController: UIViewController {
    var participantType: ParticipantType = .four
    var gameType: GameType = .five
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .top
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    let segmentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImg()
        run(game: PockerGame(number: participantType, number: gameType))
    }
    
    func run(game: PockerGame) {
        game.gameStart()
        let dealer = game.getDealer()
        let participants = game.getParticipants().getParticipants()
        
        addMainStackView()
        addSegmentStackView()
        addCardImg(stackView: addCardsStackView(), player: dealer)
        
        for i in 0..<participants.count {
            addCardImg(stackView: addCardsStackView(), player:participants[i])
        }
    }
    
    func resetPockerGame(game: PockerGame) {
        self.segmentStackView.arrangedSubviews.forEach({ (segmentStackView) in
            self.segmentStackView.removeArrangedSubview(segmentStackView)
            segmentStackView.removeFromSuperview()
        })
        
        self.mainStackView.arrangedSubviews.forEach({ (cardStackView) in
            self.mainStackView.removeArrangedSubview(cardStackView)
            cardStackView.removeFromSuperview()
        })
        
        run(game: game)
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
    
    func addSegmentStackView() {
        let gameTypeSegment = UISegmentedControl(items: ["7Cards", "5Cards"])
        let participantTypeSegment = UISegmentedControl(items: ["2명", "3명", "4명"])
        gameTypeSegment.addTarget(self, action: #selector(changeGameType(value:)), for: UIControl.Event.valueChanged)
        participantTypeSegment.addTarget(self, action: #selector(changeParticipantType(value:)), for: UIControl.Event.valueChanged)

        self.view.addSubview(segmentStackView)
        segmentStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        segmentStackView.bottomAnchor.constraint(equalTo: self.mainStackView.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        segmentStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        segmentStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
        self.segmentStackView.addArrangedSubview(gameTypeSegment)
        self.segmentStackView.addArrangedSubview(participantTypeSegment)
        participantTypeSegment.tintColor = UIColor.white
        
    }
    @objc func changeGameType(value: UISegmentedControl) {
        let stud: GameType
        switch value.selectedSegmentIndex {
        case 0:
            stud = .seven
        case 1:
            stud = .five
        default:
            return
        }
        resetPockerGame(game: PockerGame(number: self.participantType, number: stud))
    }
    @objc func changeParticipantType(value: UISegmentedControl) {
        let participant: ParticipantType
        switch value.selectedSegmentIndex {
        case 0:
            participant = .two
        case 1:
            participant = .three
        case 2:
            participant = .four
        default:
            return
        }
        resetPockerGame(game: PockerGame(number: participant, number: self.gameType))
    }
    
    func addCardImg(stackView: UIStackView, player: Player) {
        self.mainStackView.addArrangedSubview(addLabel(name: player.getName()))
        self.mainStackView.addArrangedSubview(stackView)

        player.getCard().forEach({ cardName in
            stackView.addArrangedSubview(createImgView(name: "\(cardName).png"))
        })
    }
    func addLabel(name: String) -> UILabel {
        let label = UILabel()
        label.text = name
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)

        return label
    }
    
    func addMainStackView() {
        self.view.addSubview(mainStackView)
        mainStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
    }
    
    func addCardsStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = -2
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
