//
//  ViewController.swift
//  PokerGameApp
//
//  Created by user on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {

    private let divideYSpace: CGFloat = 8
    private let divedeXSpace: CGFloat = 3
    
    private var allPlayerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private var game = PokerGame()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let bgImg = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: bgImg)
        }
        
        segmentStackView()
        
        self.view.addSubview(allPlayerStackView)
        let topSpace = self.view.frame.height / self.divideYSpace + 20
        allPlayerStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: topSpace).isActive = true
        allPlayerStackView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        allPlayerStackView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        
    }

    func gameStart() {
        game.startGame()
        deletePlayerStackView()
        makePlayerStackView()
    }
    
    func deletePlayerStackView() {
        allPlayerStackView.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
    }
    
    func makePlayerStackView() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        var label = ""
        var playerCount = 1
        
        game.playersInfo { player in
            label = "Player\(playerCount)"
            stackView.addArrangedSubview(makePlayerLabel(label))
            stackView.addArrangedSubview(makePlayerCard(player))
            
            playerCount += 1
        }
        
        game.dealerCardsInfo { Dealer in
            label = "Dealer"
            stackView.addArrangedSubview(makePlayerLabel(label))
            stackView.addArrangedSubview(makePlayerCard(Dealer))
        }
        
        allPlayerStackView.addArrangedSubview(stackView)
    }
    
    func makePlayerLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = UIColor.white
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return label
    }
    
    func makePlayerCard(_ player: Player) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = -8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        player.cardsInfo { card in
            stackView.addArrangedSubview(makeCardImage(card))
        }
        
        return stackView
    }
    
    func makeCardImage(_ card: PokerCard) -> UIImageView {
        let cardImage = UIImage(named: "\(card)")
        let imageView = UIImageView(image: cardImage)
        
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1/1.27).isActive = true
        return imageView
    }
    
    func segmentStackView() {
        let segmentHeight = self.view.frame.height / self.divideYSpace
        let segmentWidth = self.view.frame.width / self.divedeXSpace
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: segmentHeight).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: segmentWidth).isActive = true
        
        let studSegment = Segment().studSegment()
        studSegment.addTarget(self, action: #selector(studChanged(sender: )), for: .valueChanged)
        
        let playerSegment = Segment().playerSegment()
        playerSegment.addTarget(self, action: #selector(playersChanged(sender:)), for: .valueChanged)
        
        stackView.addArrangedSubview(studSegment)
        stackView.addArrangedSubview(playerSegment)
    }
    
    @IBAction func studChanged(sender: UISegmentedControl) {
        let stud = Stud.studType[sender.selectedSegmentIndex]
        game.selectStud(stud: stud)
        gameStart()
    }

    @IBAction func playersChanged(sender: UISegmentedControl) {
        let player = NumberOfPlayers.playerType[sender.selectedSegmentIndex]
        game.selectPlayers(numberOfPlayers: player)
        gameStart()
    }

}

class Segment {
    
    func studSegment() -> UISegmentedControl {
        var segmentItem: [String] = []
        Stud.allCases.forEach() { segmentItem.append("\($0)") }
        let segmentedControl = UISegmentedControl(items: segmentItem)

        return make(segmentedControl)
    }
    
    func playerSegment() -> UISegmentedControl {
        var segmentItem: [String] = []
        NumberOfPlayers.allCases.forEach() { segmentItem.append("\($0)") }
        let segmentedControl = UISegmentedControl(items: segmentItem)
        
        return make(segmentedControl)
    }
    
    func make(_ segmentedControl: UISegmentedControl) -> UISegmentedControl {
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.setTitleTextAttributes([.foregroundColor:UIColor.white], for: .normal)
        segmentedControl.setTitleTextAttributes([.foregroundColor:UIColor.black], for: .selected)
        segmentedControl.layer.borderColor = UIColor.white.cgColor
        segmentedControl.layer.borderWidth = 2
        
        return segmentedControl
    }
}
