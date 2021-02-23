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
    var game: PockerGame!
    
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
        setBackgroundImage()
        game = PockerGame(participantType: participantType, gameType: gameType)
        run(game: game)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setBackgroundImage() {
        guard let backgroundImg = UIImage(named: "bg_pattern.png") else {
            return
        }
        self.view.backgroundColor = UIColor(patternImage: backgroundImg)
    }
    
    func createGameView() {
        let dealer = game.getDealer()
        let participants = game.getParticipants()
        
        addLabel(name: "딜러")
        addCardImage(player: dealer)
        
        participants.eachParticipant(method: { (index, participant) in
            addLabel(name: "플레이어\(index)")
            addCardImage(player: participant)
        })
    }
    
    func addCardImage(player: Player) {
        let stackView = addCardsStackView()
        self.mainStackView.addArrangedSubview(stackView)

        player.eachCard {
            cardName in
               stackView.addArrangedSubview(createImgView(name: "\(cardName).png"))
        }
    }
    
    func addLabel(name: String) {
        let label = UILabel()
        label.text = name
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        self.mainStackView.addArrangedSubview(label)
    }

    func createImgView(name: String) -> UIImageView {
        let imgView = UIImageView()
        imgView.widthAnchor.constraint(equalTo: imgView.heightAnchor, multiplier: 1.0/1.27).isActive = true
        imgView.image = UIImage(named: name)
        return imgView
    }

    func run(game: PockerGame) {
        game.gameStart()
        addMainStackView()
        addSegmentStackView()
        createGameView()
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
    
    func addSegmentStackView() {
        let gameTypeSegment = UISegmentedControl(items: GameType.allItems)
        let participantTypeSegment = UISegmentedControl(items: ParticipantType.allItems)
        gameTypeSegment.addTarget(self, action: #selector(changeGameType(sender:)), for: UIControl.Event.valueChanged)
        participantTypeSegment.addTarget(self, action: #selector(changeParticipantType(sender:)), for: UIControl.Event.valueChanged)

        self.view.addSubview(segmentStackView)
        segmentStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        segmentStackView.bottomAnchor.constraint(equalTo: self.mainStackView.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        segmentStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        segmentStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
        self.segmentStackView.addArrangedSubview(gameTypeSegment)
        self.segmentStackView.addArrangedSubview(participantTypeSegment)
        participantTypeSegment.tintColor = UIColor.white
        
    }
    
    @objc func changeGameType(sender: UISegmentedControl) {
        let stud = GameType.init(rawValue:sender.selectedSegmentIndex)
        self.game.setGameType(gameType: stud)
        resetPockerGame(game: game)
    }
    
    @objc func changeParticipantType(sender: UISegmentedControl) {
        let participant = ParticipantType.init(rawValue: sender.selectedSegmentIndex)
        self.game.setParticipantType(participantType: participant)
        resetPockerGame(game: game)
    }
}
