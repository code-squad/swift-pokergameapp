//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 이다훈 on 2021/02/16.
//

import UIKit

class ViewController: UIViewController {
    
    let trouble = TroubleShooter()
    let pokerGame = PokerGame(howManyHands: .sevenCardStud, howManyPlayer: .one)
    
    let segmentStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    let playersStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 30
        return stackView
    }()

    let playerInfoStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 5
        return stackView
    }()
    
    let gameStyleSegmentControl : UISegmentedControl = {
        let segment = UISegmentedControl(items: GameStyle.gameTypes)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(gameStyleChanged(_:)), for: .valueChanged)
        return segment
    }()
    
    let gamePlayerSegmentControl  : UISegmentedControl = {
        let segment = UISegmentedControl(items: PlayerCount.availablePlayerCount)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(gamePlayerChanged(_:)), for: .valueChanged)
        return segment
    }()
    
    @objc func gameStyleChanged (_ sender : UISegmentedControl) {
        
        let calculatedSelectedGameStyleIndex = 7 - 2 * sender.selectedSegmentIndex // 7stud : rawValue = 7, 5stud : 5 so func y = -2x + 7 , x = sender.selectedSgementIndex -> {0,1}. so y= {7,5}
        let selectedGameStyle = GameStyle.init(rawValue: calculatedSelectedGameStyleIndex) ?? .sevenCardStud
        
        pokerGame.reset(with: selectedGameStyle)
        self.gameStart()
        updatePlayerUIs()
        printPlayerInfo()
    }
    
    @objc func gamePlayerChanged (_ sender : UISegmentedControl) {
        
        let selectedPlayerCount = PlayerCount.init(rawValue: sender.selectedSegmentIndex + 1) ?? .one
        pokerGame.reset(howMany: selectedPlayerCount)
        
        self.gameStart()
        updatePlayerUIs()
        printPlayerInfo()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            pokerGame.reset()
            self.gameStart()
            updatePlayerUIs()
            printPlayerInfo()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        if self.view.subviews.count == 0 {
            do {
                self.view.backgroundColor = UIColor(patternImage: try optionalBindingImage(calledCard: "bg_pattern"))
            }
            catch {
                print(error)
                present(trouble.personalError(), animated: true, completion: nil)
            }
            gameStart()
            makeUIs()
            printPlayerInfo()
        }
    }
    
    private func gameStart() {
        if false == pokerGame.start() {
            pokerGame.resetDeck()
            pokerGame.reset()
        }
    }
    
    private func makeUIs() {
        setSegmentStackViewConstraints()
        setSegmentControllerConstraints()
        setPlayersStackViewConstraints()
        makePlayerUIs()
    }
    
    private func makePlayerUIs() {
        pokerGame.showParticipatnsInfo(do: { playerDeck,playerName  in
            let name = playerName
            let cards = playerDeck.toStringArray()
            
            setPlayerInfoStackView(with: name)
            createCardStackView(with: card2FileName(with: cards))
        })
    }
    
    private func setSegmentStackViewConstraints() {
        self.view.addSubview(segmentStackView)
        segmentStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        segmentStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        segmentStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setSegmentControllerConstraints() {
        gamePlayerSegmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .selected)
        gamePlayerSegmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        gameStyleSegmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .selected)
        gameStyleSegmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        self.segmentStackView.addArrangedSubview(gamePlayerSegmentControl)
        self.segmentStackView.addArrangedSubview(gameStyleSegmentControl)
    }
    
    private func setPlayersStackViewConstraints() {
        self.view.addSubview(playersStackView)
        playersStackView.topAnchor.constraint(equalTo: segmentStackView.bottomAnchor, constant: 30).isActive = true
        playersStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        playersStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setPlayerInfoStackView(with playerName : String) {
        playersStackView.addArrangedSubview(playerInfoStackView)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.left
        label.text = playerName
        
        playerInfoStackView.addArrangedSubview(label)
    }
    
    private func createCardStackView(with cardFileNames: [String]) {
        let cardStackView : UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.spacing = -10
            stackView.distribution = .fillEqually
            return stackView
        }()
        addCard2CardView(with: cardFileNames, stackView: cardStackView)
        playerInfoStackView.addArrangedSubview(cardStackView)
    }
    
    private func addCard2CardView(with cardFileNames: [String] ,stackView : UIStackView) {
        for fileName in cardFileNames {
            stackView.addArrangedSubview(generateCardImage(with: fileName))
        }
    }
    
    private func optionalBindingImage(calledCard : String) throws -> UIImage {
        guard let image = UIImage(named: calledCard) else {
            throw TroubleShooter.errors.imageOptionalBindingError
        }
        return image
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    private func generateCardImage(with cardFileName : String) -> UIImageView {
        var image = UIImage()
        do {
            image = try optionalBindingImage(calledCard: cardFileName)
        }
        catch {
            print(error, cardFileName)
            image = UIImage.init(named: "card-back") ?? UIImage()
        }
        
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.27).isActive = true
        return imageView
    }
    
    func card2FileName(with cardNames: [String]) -> [String] {
        var cardFileNames = [String]()
        for card in cardNames {
            var fileName = String()
            switch String(card.first ?? "f") {
                case "\u{2660}": //spade
                    fileName = "s" + card.trimmingCharacters(in: .symbols)
                case "\u{2665}": //heart
                    fileName = "h" + card.trimmingCharacters(in: .symbols)
                case "\u{2666}": //diamond
                    fileName = "d" + card.trimmingCharacters(in: .symbols)
                case "\u{2663}": //club
                    fileName = "c" + card.trimmingCharacters(in: .symbols)
                default:
                    fileName = "card-back"
            }
            cardFileNames.append(fileName)
        }
        return cardFileNames
    }
    
    func updatePlayerUIs() {
        playersStackView.subviews.forEach({
        $0.subviews.forEach({
            $0.removeFromSuperview()
        })
        $0.removeFromSuperview()
        })
        makePlayerUIs()
    }
    
    func printPlayerInfo() {
        
        let printClosure = { (hand: Deck,name: String) -> Void in
            print("\(name) : \(hand)")
        }
        pokerGame.showParticipatnsInfo(do: printClosure)
    }
}

