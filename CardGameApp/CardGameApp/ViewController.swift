import UIKit

class ViewController: UIViewController {
    
    let cardStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.backgroundColor = .yellow
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "pattern"))
        
        view.addSubview(cardStackView)
        addConstraintsToStack()
        addCardsToStackView()
        
        let heartsOfTwelve = Card(suit: .hearts, rank: .queen)
        print(heartsOfTwelve)
        let spadesOfSeven = Card(suit: .spades, rank: .seven)
        print(spadesOfSeven)
        
        let cardDeck = CardDeck()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func addConstraintsToStack() {
        cardStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        cardStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        cardStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
    }
    
    func setCardBackImage() -> UIImageView {
        let cardBackImage = UIImageView(image: #imageLiteral(resourceName: "card-back"))
        cardBackImage.heightAnchor.constraint(equalTo: cardBackImage.widthAnchor, multiplier: 1.27).isActive = true
        return cardBackImage
    }
    
    func addCardsToStackView() {
        for _ in 1...7 {
            let cardBackImage = setCardBackImage()
            cardBackImage.contentMode = .scaleAspectFit
            cardStackView.addArrangedSubview(cardBackImage)
        }
    }
}
