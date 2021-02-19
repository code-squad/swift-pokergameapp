import UIKit

class ViewController: UIViewController {
    enum TypeOfSegmentedControl {
        case players
        case cards
    }
    
    var pokerGame: PokerGame!
    var pokerPlate: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initPokerPlate()
        
        if let pattern = UIImage(named: "bg_pattern.png") {
            self.view.backgroundColor = UIColor(patternImage: pattern)
        }
        makeSegmentedControl(typeof: .cards)
        makeSegmentedControl(typeof: .players)
        pokerGame = PokerGame(numberOfPlayer: .twoPlayer, stud: .sevenCardStud)
        
//        pokerGame.start()
    }
    
    private func resetPokerGame(numberOfPlayer: Participant, stud: CardStud) {
        for subview in self.view.subviews where !(subview is UISegmentedControl) {
            subview.removeFromSuperview()
        }
        
        pokerGame = PokerGame(numberOfPlayer: numberOfPlayer, stud: stud)
        pokerPlate = UIStackView()
        initPokerPlate()
        
        for player in pokerGame.players.list {
            let playerNameLabel = setPlayerNameLabel(name: player.name)
            let imageStackView = setImageStackView(stud: stud)
            addPlayersStackViewIntoPokerPlate(imageStackView: imageStackView, nameLabel: playerNameLabel, numberOfPlayer: numberOfPlayer)
        }
        
        makeStartButton()
        constraintSettingPokerPlate()
    }

    
    private func constraintSettingPokerPlate() {
        let margin = view.layoutMarginsGuide
        guard let lastElement = self.view.subviews.last else { return }
        let lastElementMargin = lastElement.layoutMarginsGuide
        
        guard let lastSegmentedControlIndex = self.view.subviews.lastIndex(where: { $0 is UISegmentedControl }) else { return }
        let lastSegmentedControl = self.view.subviews[lastSegmentedControlIndex]
        let lastSegmentedControlMargin = lastSegmentedControl.layoutMarginsGuide
        
        
        self.view.addSubview(pokerPlate)
        
        pokerPlate.translatesAutoresizingMaskIntoConstraints = false
        
        pokerPlate.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: 5).isActive = true
        pokerPlate.trailingAnchor.constraint(equalTo: margin.trailingAnchor, constant: -20).isActive = true
        pokerPlate.topAnchor.constraint(equalTo: lastSegmentedControlMargin.bottomAnchor, constant: 0).isActive = true
        pokerPlate.bottomAnchor.constraint(equalTo: lastElementMargin.topAnchor, constant: -50).isActive = true
    }
    
    
    private func initPokerPlate() {
        pokerPlate = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .equalSpacing
            stackView.alignment = .top
            stackView.spacing = 10
            return stackView
        }()
    }
    
    private func addPlayersStackViewIntoPokerPlate(imageStackView: UIStackView, nameLabel: UILabel, numberOfPlayer: Participant){
        
        for _ in 1...numberOfPlayer.rawValue {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.spacing = 0
            stackView.addArrangedSubview(nameLabel)
            stackView.addArrangedSubview(imageStackView)
            
            pokerPlate.addArrangedSubview(stackView)
        }
        
    }
    
    private func makeStartButton() {
        let startButton = UIButton()
        startButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        startButton.backgroundColor = .clear
        startButton.layer.cornerRadius = 5
        startButton.layer.borderWidth = 2
        startButton.layer.borderColor = UIColor.white.cgColor
        
        startButton.setTitle("게임 시작", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        
        self.view.addSubview(startButton)
        
        startButton.translatesAutoresizingMaskIntoConstraints = false

        startButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        startButton.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: 0).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    private func setPlayerNameLabel(name: String) -> UILabel {
        let nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        nameLabel.textColor = .white
        
        return nameLabel
    }
    
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
        
        self.view.addSubview(segmentedControl)
        
        constraintSettingSegmentedControl(segmentedControl)
    }
    
    private func constraintSettingSegmentedControl(_ segmentedControl: UISegmentedControl) {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        let margin = view.layoutMarginsGuide
        if self.view.subviews.count <= 1 {
            segmentedControl.topAnchor.constraint(equalTo: margin.topAnchor, constant: 20).isActive = true
        } else if let topSegmentedControl = self.view.subviews.first {
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
        case 0: resetPokerGame(numberOfPlayer: pokerGame.participant, stud: .sevenCardStud)
        case 1: resetPokerGame(numberOfPlayer: pokerGame.participant, stud: .fiveCardStud)
        default: return
        }
    }
    
    @objc private func configWhenPlayersSegmentSelected(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0: resetPokerGame(numberOfPlayer: .twoPlayer, stud: pokerGame.cardStud)
        case 1: resetPokerGame(numberOfPlayer: .threePlayer, stud: pokerGame.cardStud)
        case 2: resetPokerGame(numberOfPlayer: .fourPlayer, stud: pokerGame.cardStud)
        default: return
        }
    }
    
    private func setImageStackView(stud: CardStud) -> UIStackView {
        let imageStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.alignment = .center
            stackView.spacing = stud == .sevenCardStud ? -5 : 20
            return stackView
        }()
        
        let cardImageViews = createCards(count: stud.rawValue)
        cardImageViews.forEach { (imageView) in
            imageStackView.addArrangedSubview(imageView)
        }
        
        return imageStackView
    }
    
    private func createCards(count: Int) -> [UIView] {
        guard let image = UIImage(named: "card-back.png") else { return [UIView]() }
        
        var cards = [UIView]()
        
        for _ in 1...count {
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
}

