
import UIKit

class ViewController: UIViewController {
    
    var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackGround()
        setStackView()
        addCardIntoStackView()
        TestCardGame.init()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    private func setUpBackGround () {
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background"))
    }

    private func setStackView() {
        self.view.addSubview(stackView)
        self.stackView.axis = .horizontal
        self.stackView.distribution = .fillEqually
        self.stackView.spacing = 4
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
    }

    private func addCardIntoStackView() {
        for _ in 0..<7 {
            self.stackView.addArrangedSubview(cardArrangement())
        }
    }

    private func cardArrangement() -> UIImageView {
        let cardImage = UIImageView(image: #imageLiteral(resourceName: "card_back"))
        cardImage.contentMode = .scaleAspectFill
        cardImage.translatesAutoresizingMaskIntoConstraints = false
        cardImage.heightAnchor.constraint(equalTo: cardImage.widthAnchor, multiplier: 1.27).isActive = true
        return cardImage
    }

}

