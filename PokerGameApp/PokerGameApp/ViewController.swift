import UIKit

class ViewController: UIViewController {
    enum TypeOfSegmentedControl {
        case players
        case cards
    }
    
    var pokerGame: PokerGame = PokerGame(numberOfPlayer: .twoPlayer, stud: .sevenCardStud)
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
    private func setPokerGame(numberOfPlayer: Participant, stud: CardStud) {
        for subview in self.view.subviews where !(subview is UISegmentedControl) {
            subview.removeFromSuperview()
        }
        pokerGame = PokerGame(numberOfPlayer: numberOfPlayer, stud: stud)
        pokerPlate = UIStackView()
        initPokerPlate()
        pokerGame.players.resetPlayersCard()
        
        
        for player in pokerGame.players.list {
            let playerNameLabel = setPlayerNameLabel(name: player.name)
            let imageStackView = setImageStackView(stud: stud, player: player)
            addPlayersStackViewIntoPokerPlate(imageStackView: imageStackView, nameLabel: playerNameLabel, numberOfPlayer: numberOfPlayer)
        }
    }

    //MARK: Set PokerPlate
    private func addPlayersStackViewIntoPokerPlate(imageStackView: UIStackView, nameLabel: UILabel, numberOfPlayer: Participant){
        
        for _ in 1...numberOfPlayer.rawValue {
            let playerStackView: UIStackView = {
                let stackView = UIStackView()
                stackView.axis = .vertical
                stackView.distribution = .fill
                stackView.spacing = 0
                stackView.addArrangedSubview(nameLabel)
                stackView.addArrangedSubview(imageStackView)
                return stackView
            }()
            
            pokerPlate.addArrangedSubview(playerStackView)
        }
    }
    
    private func initPokerPlate() {
        pokerPlate = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .equalSpacing
            stackView.spacing = 10
            return stackView
        }()
        
        let margin = view.layoutMarginsGuide
        
        guard let lastSegmentedControlIndex = self.view.subviews.lastIndex(where: { $0 is UISegmentedControl }) else { return }
        let lastSegmentedControl = self.view.subviews[lastSegmentedControlIndex]
        let lastSegmentedControlMargin = lastSegmentedControl.layoutMarginsGuide
        
        self.view.addSubview(pokerPlate)
        
        pokerPlate.translatesAutoresizingMaskIntoConstraints = false
        pokerPlate.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: 5).isActive = true
        pokerPlate.trailingAnchor.constraint(equalTo: margin.trailingAnchor, constant: -20).isActive = true
        pokerPlate.topAnchor.constraint(equalTo: lastSegmentedControlMargin.bottomAnchor, constant: 0).isActive = true
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
            case .cards: segmentedControl = UISegmentedControl(items: ["7 Cards", "5 Cards"])
            case .players: segmentedControl = UISegmentedControl(items: ["2명", "3명", "4명"])
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
        switch segmentedControl.selectedSegmentIndex {
        case 0: setPokerGame(numberOfPlayer: .twoPlayer, stud: pokerGame.cardStud)
        case 1: setPokerGame(numberOfPlayer: .threePlayer, stud: pokerGame.cardStud)
        case 2: setPokerGame(numberOfPlayer: .fourPlayer, stud: pokerGame.cardStud)
        default: return
        }
    }
    
    //MARK:Image set
    private func setImageStackView(stud: CardStud, player: Playable) -> UIStackView {
        let imageStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.alignment = .center
            stackView.spacing = stud == .sevenCardStud ? -5 : 20
            return stackView
        }()
        
        let cardImageViews = createCards(stud: stud, player: player)
        cardImageViews.forEach { (imageView) in
            imageStackView.addArrangedSubview(imageView)
        }
        
        return imageStackView
    }
    
    private func createCards(stud: CardStud, player: Playable) -> [UIView] {
        var cards = [UIView]()
        
        pokerGame.shareCards(cardStud: stud, player: player) { (card) in
            guard let image = UIImage(named: card.description) else { return }
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

