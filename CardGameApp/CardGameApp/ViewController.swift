//
//  ViewController.swift
//  CardGameApp
//
//  Created by jinie on 2020/02/11.
//  Copyright © 2020 jinie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private var studControl: UISegmentedControl!
    private var playersControl: UISegmentedControl!
    private var stud: Poker.Stud = .sevenCard
    private var numberOfPlayers: Poker.NumberOfPlayers = .two

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern")!)
        displayControl()
        setUpPlay()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake { setUpPlay() }
    }
    
    @objc private func studControlAction() {
        let segments: [Poker.Stud] = [.sevenCard, .fiveCard]
        stud = segments[studControl.selectedSegmentIndex]
        setUpPlay()
    }
    
    @objc private func playersControlAction() {
        let segments: [Poker.NumberOfPlayers] = [.two, .three, .four]
        numberOfPlayers = segments[playersControl.selectedSegmentIndex]
        setUpPlay()
    }
    
    private func displayControl() {
        studControl = UISegmentedControl(items: ["7 Cards", "5 Cards"])
        studControl.frame = CGRect(x: (self.view.frame.width / 3), y: 60, width: (self.view.frame.width / 3), height: 30)
        studControl.customizeAppearance()
        studControl.addTarget(self, action: #selector(studControlAction), for: .valueChanged)
        playersControl = UISegmentedControl(items: ["2명", "3명", "4명"])
        playersControl.frame = CGRect(x: (self.view.frame.width / 3), y: 100, width: (self.view.frame.width / 3), height: 30)
        playersControl.customizeAppearance()
        playersControl.addTarget(self, action: #selector(playersControlAction), for: .valueChanged)
        self.view.addSubview(studControl)
        self.view.addSubview(playersControl)
    }
    
    private func horizontalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = -10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func verticalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.tag = 1
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func setUpPlay() {
        self.view.viewWithTag(1)?.removeFromSuperview()
        let poker = Poker(stud: stud, numberOfPlayers: numberOfPlayers)
        poker.start()
        let allStackView = verticalStackView()
        numberOfPlayers.forEach { playerIndex in
            let stackView = horizontalStackView()
            stud.forEach { cardIndex in
                let card = poker.playersHands()[playerIndex][cardIndex]
                let cardView = UIImageView(image: UIImage(named: String(describing: card)))
                stackView.addArrangedSubview(cardView)
                cardView.heightAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 1.27).isActive = true
            }
            let label = UILabel()
            label.text = "Player\(playerIndex + 1)"
            label.textColor = .white
            allStackView.addArrangedSubview(label)
            allStackView.addArrangedSubview(stackView)
        }
        let stackView = horizontalStackView()
        stud.forEach { cardIndex in
            let card = poker.dealerHands()[cardIndex]
            let cardView = UIImageView(image: UIImage(named: String(describing: card)))
            stackView.addArrangedSubview(cardView)
            cardView.heightAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 1.27).isActive = true
        }
        let label = UILabel()
        label.text = "Dealer"
        label.textColor = .white
        allStackView.addArrangedSubview(label)
        allStackView.addArrangedSubview(stackView)
        self.view.addSubview(allStackView)
        let constraints = [
            allStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160.0),
            allStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40.0),
            allStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40.0)
        ]
        NSLayoutConstraint.activate(constraints)
    }

}

extension UISegmentedControl {
    func customizeAppearance() {
        self.selectedSegmentIndex = 0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
    }
}
