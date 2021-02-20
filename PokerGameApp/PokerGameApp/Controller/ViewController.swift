//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 조중윤 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    enum NumberOfPlayers: Int {
        case one = 1
        case two
        case three
        case four
    }
    
    enum StudVariant: Int {
        case fiveCardStud = 5
        case sevenCardStud = 7
    }
    var playerNumbers: NumberOfPlayers = .one
    var studVariant: StudVariant = .fiveCardStud
    
    
    lazy var studSelectSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["7 cards", "5 cards"])
        control.selectedSegmentIndex = 0
        control.layer.cornerRadius = 5.0
        control.layer.masksToBounds = true
        control.layer.borderWidth = 1
        control.layer.borderColor = CGColor.init(gray: 1, alpha: 1)
        let font = UIFont.systemFont(ofSize: 15)
        let normalTextAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: font
        ]
        let selectedTextAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: font
        ]
        control.setTitleTextAttributes(normalTextAttributes, for: .normal)
        control.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        control.translatesAutoresizingMaskIntoConstraints = false
        control.addTarget(self, action: #selector(selectStud(_:)), for: .valueChanged)
        return control
     }()
    
    lazy var numberOfPlayersSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["2명", "3명", "4명"])
        control.selectedSegmentIndex = 0
        control.tintColor = UIColor.white
        control.layer.cornerRadius = 5.0
        control.layer.masksToBounds = true
        control.layer.borderWidth = 1
        control.layer.borderColor = .init(gray:1, alpha: 1)
        let font = UIFont.systemFont(ofSize: 15)
        let normalTextAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: font
        ]
        let selectedTextAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: font
        ]
        control.setTitleTextAttributes(normalTextAttributes, for: .normal)
        control.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        control.translatesAutoresizingMaskIntoConstraints = false
        control.addTarget(self, action: #selector(selectNumberOfPlayers(_:)), for: .valueChanged)
        return control
     }()
    
    let verticalStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.backgroundColor = .blue
        stackView.alignment = .leading
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundPatternImage: UIImage = UIImage(named: "bg_pattern") ?? UIImage()
        let cardBacksideImage: UIImage = UIImage(named: "card-back") ?? UIImage()
        self.view.backgroundColor = UIColor(patternImage: backgroundPatternImage)
        
        self.view.addSubview(studSelectSegmentedControl)
        configureCardNumberSelectSegmentedControl()
        self.view.addSubview(numberOfPlayersSegmentedControl)
        configureNumberOfPlayersSegementedControl()
    }
    
    func gameInteration() {
        var game = PokerGame(playersOf: playerNumbers.rawValue, stud: studVariant.rawValue)
        self.view.addSubview(verticalStackView)
        configureVerticalStackView()
        guard let gameResult = game.play() else { return }
        print(gameResult)
        generateGameDashBoard(with: gameResult)
    }
    
    func configureVerticalStackView() {
        verticalStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        verticalStackView.topAnchor.constraint(equalTo: self.numberOfPlayersSegmentedControl.bottomAnchor, constant: 5).isActive = true
        verticalStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: self.view.frame.width/20).isActive = true
        verticalStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -self.view.frame.width/20).isActive = true
        verticalStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor, constant: -self.view.frame.height/10).isActive = true
    }
    
    func configureNumberOfPlayersSegementedControl() {
        numberOfPlayersSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        numberOfPlayersSegmentedControl.topAnchor.constraint(equalTo: self.studSelectSegmentedControl.bottomAnchor, constant: 5).isActive = true
        numberOfPlayersSegmentedControl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.33).isActive = true
        numberOfPlayersSegmentedControl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
    }
    
    func configureCardNumberSelectSegmentedControl() {
        studSelectSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        studSelectSegmentedControl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        studSelectSegmentedControl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.33).isActive = true
        studSelectSegmentedControl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
    }
    
    func generateGameDashBoard(with game: Array<Array<Card>>) {
        for (index, participant) in game.enumerated() {
            var playerTag: String = ""
            if index == game.count-1 {
                playerTag = "Dealer"
            } else {
                playerTag = "Player\(index+1)"
            }
            verticalStackView.addArrangedSubview(makePlayerTagLabel(with: playerTag))
            verticalStackView.addArrangedSubview(makeindividuallCardStacks(with: participant, with: UIImage()))
//            verticalStackView.addArrangedSubview(makePlayerTagLabel(with: ""))
        }
    }
    
    func makePlayerTagLabel(with name: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.backgroundColor = .red
        label.text = name
        label.heightAnchor.constraint(equalToConstant: self.view.frame.height/30).isActive = true
        return label
    }
    
    func makeindividuallCardStacks(with cards: Array<Card>, with prizeImage: UIImage) -> UIStackView {
        let stackView = horizontalStackView()
        for card in cards {
            let newCardImageView = card.makeCardImageView()
            stackView.addArrangedSubview(newCardImageView)
        }
        let prizeImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = prizeImage
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        stackView.heightAnchor.constraint(equalToConstant: self.view.frame.height/10).isActive = true
        stackView.addArrangedSubview(prizeImageView)
        return stackView
    }
    
    func horizontalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = -20
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }
    
    @objc func selectStud(_ sender: UISegmentedControl) {
        verticalStackView.removeFullyAllArrangedSubviews()
        switch sender.selectedSegmentIndex {
        case 0:
            studVariant = .sevenCardStud
        case 1:
            studVariant = .fiveCardStud
        default:
            print("meh")
        }
        gameInteration()
    }
    
    @objc func selectNumberOfPlayers(_ sender: UISegmentedControl) {
        verticalStackView.removeFullyAllArrangedSubviews()
        switch sender.selectedSegmentIndex {
        case 0:
            playerNumbers = .two
        case 1:
            playerNumbers = .three
        case 2:
            playerNumbers = .four
        default:
            print("meh")
        }
        gameInteration()
    }
}
extension UIStackView {
    func removeFully(view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }

    func removeFullyAllArrangedSubviews() {
        arrangedSubviews.forEach { (view) in
            removeFully(view: view)
        }
    }
}
