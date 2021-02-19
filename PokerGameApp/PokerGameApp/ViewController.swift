import UIKit

class ViewController: UIViewController {
    enum TypeOfSegmentedControl {
        case players
        case cards
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pattern = UIImage(named: "bg_pattern.png") {
            self.view.backgroundColor = UIColor(patternImage: pattern)
        }
        makeSegmentedControl(typeof: .cards)
        makeSegmentedControl(typeof: .players)
        
        setImageStackView()
        
        let pokerGame = PokerGame(numberOfPlayer: .fourPlayer, stud: .fiveCardStud)
        pokerGame.start()
    }
    
    private func makeSegmentedControl(typeof segmentedControlType: TypeOfSegmentedControl) {
        let segmentedControl: UISegmentedControl = {
            var segmentedControl: UISegmentedControl
            switch segmentedControlType {
            case .cards: segmentedControl = UISegmentedControl(items: ["7 Cards", "5 Cards"])
            case .players: segmentedControl = UISegmentedControl(items: ["2명", "3명", "4명"])
            }
            setSegmentedControlAttribute(segmentedControl)
            return segmentedControl
        }()
        
        self.view.addSubview(segmentedControl)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        let margin = view.layoutMarginsGuide
        
        if self.view.subviews.count <= 1 {
            segmentedControl.topAnchor.constraint(equalTo: margin.topAnchor, constant: 40).isActive = true
        } else if let topSegmentedControl = self.view.subviews.first {
            let segmentedControlMargin = topSegmentedControl.layoutMarginsGuide
            segmentedControl.topAnchor.constraint(equalTo: segmentedControlMargin.bottomAnchor, constant: 20).isActive = true
        }
        
        segmentedControl.centerXAnchor.constraint(equalTo: margin.centerXAnchor).isActive = true
        segmentedControl.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    private func setSegmentedControlAttribute(_ segmentedControl: UISegmentedControl) {
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
    }
    
    
    
    
    private func setImageStackView() {
        let imageStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.alignment = .center
            stackView.spacing = -5
            return stackView
        }()
        
        let cardImageViews = createCards(count: 7)
        cardImageViews.forEach { (imageView) in
            imageStackView.addArrangedSubview(imageView)
        }
        
        configImageStackView(imageStackView)
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
    
    private func configImageStackView(_ stackView: UIStackView) {
        guard let lastElement = self.view.subviews.last else { return }
        let lastElementMargin = lastElement.layoutMarginsGuide
        let margin = view.layoutMarginsGuide
        
        self.view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        stackView.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: 5).isActive = true
        stackView.trailingAnchor.constraint(equalTo: margin.trailingAnchor, constant: -20).isActive = true
        stackView.topAnchor.constraint(equalTo: lastElementMargin.bottomAnchor, constant: 20).isActive = true
    }
}

