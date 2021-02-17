import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pattern = UIImage(named: "bg_pattern.png") {
            self.view.backgroundColor = UIColor(patternImage: pattern)
        }
        
        setImageStackView()
        
        // Check Data
        let dealer = Dealer()
        dealer.start(numberOfPlayer: .fourPlayer, stud: .sevenCardStud)
        for player in dealer.players {
            print(player.name, player.result)
        }
    }
    
    private func setImageStackView() {
        let imageStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.alignment = .center
            stackView.spacing = 5
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
        self.view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let margin = self.view.layoutMarginsGuide
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
        stackView.topAnchor.constraint(equalTo: margin.topAnchor, constant: 10).isActive = true
    }
}

