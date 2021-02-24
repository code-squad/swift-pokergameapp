import UIKit

class ViewController: UIViewController {
    enum TypeOfSegmentedControl {
        case players
        case cards
    }
    
    var pokerGame: PokerGame = PokerGame()
    var pokerPlate: UIStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        
        if let pattern = UIImage(named: "bg_pattern.png") {
            self.view.backgroundColor = UIColor(patternImage: pattern)
        }
        
        initPokerPlate()
        makeSegmentedControl(typeof: .cards)
        makeSegmentedControl(typeof: .players)
        
        setPokerGame(numberOfPlayer: .twoPlayer, stud: .sevenCardStud)
        
    }
    
    //MARK: set
    private func setPokerGame(numberOfPlayer: NumberOfParticipant, stud: CardStud) {
        for subview in self.view.subviews where !(subview is UISegmentedControl) {
            subview.removeFromSuperview()
        }
        pokerGame = PokerGame(numberOfPlayer: numberOfPlayer, stud: stud)
        pokerPlate = UIStackView()
        initPokerPlate()
        pokerGame.players.resetPlayersCard()
        
        pokerGame.players.configEachPlayer { (player) in
            let playerNameLabel = setPlayerNameLabel(name: player.name)
            let imageStackView = setImageStackView(stud: stud, player: player)
            addPlayersIntoPokerPlate(imageStackView: imageStackView, nameLabel: playerNameLabel, numberOfPlayer: numberOfPlayer)
        }
        
        award()
    }
    
    private func award() {
        let winner = pokerGame.players.winnerPlayer()
        
        for subView in pokerPlate.subviews {
            guard let playerResultStackView = subView as? UIStackView else { return }
            guard let playerStackView = playerResultStackView.subviews.first as? UIStackView else { return }
            guard let label = playerStackView.subviews.first as? UILabel else { return }
            if label.text == winner.name {
                guard let winnerLabel = playerResultStackView.subviews.last as? UILabel else { return }
                winnerLabel.text = "🏅"
            }
        }
    }

    //MARK: Set PokerPlate
    private func addPlayersIntoPokerPlate(imageStackView: UIStackView, nameLabel: UILabel, numberOfPlayer: NumberOfParticipant){

        let playerStackView = makePlayerStackView(imageStackView: imageStackView, nameLabel: nameLabel)
        let winnerSignLabel = makeWinnerSignLabel()
        let playerResultStackView = makePlayerResultStackView(playerStackView: playerStackView, winnerSignLabel: winnerSignLabel)

        pokerPlate.addArrangedSubview(playerResultStackView)
    }
    
    private func makePlayerResultStackView(playerStackView: UIStackView, winnerSignLabel: UILabel) -> UIStackView{
        let playerResultStackView = UIStackView()
        playerResultStackView.axis = .horizontal
        playerResultStackView.distribution = .fill
        playerResultStackView.spacing = 5
        playerResultStackView.addArrangedSubview(playerStackView)
        playerResultStackView.addArrangedSubview(winnerSignLabel)
        playerResultStackView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        return playerResultStackView
    }
    
    private func makePlayerStackView(imageStackView: UIStackView, nameLabel: UILabel) -> UIStackView {
        let playerStackView = UIStackView()
        playerStackView.axis = .vertical
        playerStackView.distribution = .fill
        playerStackView.spacing = 5
        playerStackView.addArrangedSubview(nameLabel)
        playerStackView.addArrangedSubview(imageStackView)
        return playerStackView
    }
    
    private func makeWinnerSignLabel() -> UILabel {
        let winnerSignLabel = UILabel()
        winnerSignLabel.text = " "
        winnerSignLabel.font = UIFont.systemFont(ofSize: 45)
        winnerSignLabel.textAlignment = .center
        winnerSignLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return winnerSignLabel
    }
    
    private func initPokerPlate() {
        pokerPlate = UIStackView()
        pokerPlate.axis = .vertical
        pokerPlate.distribution = .equalSpacing

        
        let margin = view.layoutMarginsGuide
        
        guard let lastSegmentedControlIndex = self.view.subviews.lastIndex(where: { $0 is UISegmentedControl }) else { return }
        let lastSegmentedControl = self.view.subviews[lastSegmentedControlIndex]
        let lastSegmentedControlMargin = lastSegmentedControl.layoutMarginsGuide
        
        self.view.addSubview(pokerPlate)
        
        pokerPlate.translatesAutoresizingMaskIntoConstraints = false
        pokerPlate.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: 5).isActive = true
        pokerPlate.trailingAnchor.constraint(equalTo: margin.trailingAnchor, constant: -5).isActive = true
        pokerPlate.topAnchor.constraint(equalTo: lastSegmentedControlMargin.bottomAnchor, constant: 30).isActive = true
        pokerPlate.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -50).isActive = true
    }
    
    //MARK: Set PlayerNameLabel
    private func setPlayerNameLabel(name: String) -> UILabel {
        let nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        nameLabel.textColor = .white
        return nameLabel
    }
    
    //MARK: Set SegmentSelected
    private func makeSegmentedControl(typeof segmentedControlType: TypeOfSegmentedControl) {
        let segmentedControl: UISegmentedControl = {
            var segmentedControl: UISegmentedControl
            switch segmentedControlType {
            case .cards: segmentedControl = UISegmentedControl(items: cardsSegmentedControlItemsName)
            case .players: segmentedControl = UISegmentedControl(items: playersSegmentedControlItemsName)
            }
            configSegmentedControl(segmentedControl, type: segmentedControlType)
            return segmentedControl
        }()
        
        let lastSubview = self.view.subviews.last
        
        self.view.addSubview(segmentedControl)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        let margin = view.layoutMarginsGuide
        if lastSubview == nil {
            segmentedControl.topAnchor.constraint(equalTo: margin.topAnchor, constant: 20).isActive = true
        } else if let topSegmentedControl = lastSubview {
            let segmentedControlMargin = topSegmentedControl.layoutMarginsGuide
            segmentedControl.topAnchor.constraint(equalTo: segmentedControlMargin.bottomAnchor, constant: 20).isActive = true
        }
        segmentedControl.centerXAnchor.constraint(equalTo: margin.centerXAnchor).isActive = true
        segmentedControl.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    private func configSegmentedControl(_ segmentedControl: UISegmentedControl, type: TypeOfSegmentedControl) {
        let normalFontColor: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        
        let selectedFontColor: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black
        ]
        
        segmentedControl.layer.borderWidth = 1
        segmentedControl.layer.borderColor = UIColor.white.cgColor
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = .white
        segmentedControl.backgroundColor = .none
        segmentedControl.setTitleTextAttributes(normalFontColor, for: .normal)
        segmentedControl.setTitleTextAttributes(selectedFontColor, for: .selected)
        
        switch type {
        case .cards: segmentedControl.addTarget(self, action: #selector(configWhenCardsSegmentSelected(_:)), for: .valueChanged)
        case .players: segmentedControl.addTarget(self, action: #selector(configWhenPlayersSegmentSelected(_:)), for: .valueChanged)
        }
    }
    
    @objc private func configWhenCardsSegmentSelected(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0: setPokerGame(numberOfPlayer: pokerGame.participant, stud: .sevenCardStud)
        case 1: setPokerGame(numberOfPlayer: pokerGame.participant, stud: .fiveCardStud)
        default: return
        }
    }
    
    @objc private func configWhenPlayersSegmentSelected(_ segmentedControl: UISegmentedControl) {
        if let participant = NumberOfParticipant.init(rawValue: segmentedControl.selectedSegmentIndex + 2)
        {
            setPokerGame(numberOfPlayer: participant, stud: pokerGame.cardStud)
        }
    }
    
    //MARK:Image set
    private func setImageStackView(stud: CardStud, player: Playable) -> UIStackView {
        let imageStackView = UIStackView()
        imageStackView.axis = .horizontal
        imageStackView.distribution = .fillEqually
        imageStackView.alignment = .center
        imageStackView.spacing = stud == .sevenCardStud ? -5 : 20
        
        let cardImageViews = createCards(stud: stud, player: player)
        cardImageViews.forEach { (imageView) in
            imageStackView.addArrangedSubview(imageView)
        }
        
        return imageStackView
    }
    
    private func createCards(stud: CardStud, player: Playable) -> [UIView] {
        var cards = [UIView]()
        
        
        pokerGame.setNextGame(player: player) { (card) in
            let cardImageName = convertCardNameToImageName(card.description)
            guard let image = UIImage(named: cardImageName) else { return }
            let imageView = UIImageView(image: image)
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = 5
            
            let aspectRatioConstraint
                = NSLayoutConstraint(item: imageView,
                                     attribute: .height,
                                     relatedBy: .equal,
                                     toItem: imageView,
                                     attribute: .width,
                                     multiplier: 1.27,
                                     constant: 0)
            imageView.addConstraint(aspectRatioConstraint)
            cards.append(imageView)
        }
        
        return cards
    }
    
    //MARK:Shake Motion
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            setPokerGame(numberOfPlayer: pokerGame.participant, stud: pokerGame.cardStud)
        }
    }
}

extension ViewController {
    private func convertCardNameToImageName(_ card: String) -> String {
        return card.description
            .replacingOccurrences(of: "♣️", with: "c")
            .replacingOccurrences(of: "♦️", with: "d")
            .replacingOccurrences(of: "❤️", with: "h")
            .replacingOccurrences(of: "♠️", with: "s")
    }
    
    var cardsSegmentedControlItemsName: Array<String> {
        CardStud.allCases.map{ "\($0.rawValue) Cards" }
    }
    
    var playersSegmentedControlItemsName: Array<String> {
        NumberOfParticipant.allCases.map{ "\($0.rawValue)명" }
    }
}
