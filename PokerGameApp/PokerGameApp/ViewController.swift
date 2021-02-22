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
        switch sender.selectedSegmentIndex {
        case 0:
            pokerGame.reset(with: .sevenCardStud)
        case 1:
            pokerGame.reset(with: .fiveCardStud)
        default:
            break
        }
        self.gameStart()
        updatePlayerUIs()
        printPlayerInfo()
    }
    
    @objc func gamePlayerChanged (_ sender : UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            pokerGame.reset(howMany: .one)
        case 1:
            pokerGame.reset(howMany: .two)
        case 2:
            pokerGame.reset(howMany: .three)
        case 3:
            pokerGame.reset(howMany: .four)
        default:
            break
        }
        
        self.gameStart()
        updatePlayerUIs()
        printPlayerInfo()
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
            print("deck is empty, gameover. reset game")
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
        pokerGame.showParticipatnsInfo(do: { player in
            let info = player.description.components(separatedBy: ":")
            let name = info[0].trimmingCharacters(in: .whitespacesAndNewlines)
            var cards = info[1].components(separatedBy: ",").map(){
                $0.trimmingCharacters(in: .whitespacesAndNewlines)
            }
            cards = cards.map(){
                $0.trimmingCharacters(in: .punctuationCharacters)
            }
            
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
        
        let nameLabel : UILabel = {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            label.font = UIFont.systemFont(ofSize: 30)
            label.textColor = UIColor.white
            label.textAlignment = NSTextAlignment.left
            label.text = playerName
            return label
        }()
        
        playerInfoStackView.addArrangedSubview(nameLabel)
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
            switch String(card.first!) {
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
        
        let printClosure = { player in
            print(player)
        }
        pokerGame.printParticipantsInfo(do: printClosure)
    }
}

