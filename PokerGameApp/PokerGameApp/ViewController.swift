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
    private var game = PokerGame()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let bgImg = UIImage(named: "bg_pattern") {
            self.view.backgroundColor = UIColor(patternImage: bgImg)
        }
        
        //showCard()
        segmentStackView()
        allPlayerStackView()
    }

    func showCard() {
        let cardCount:CGFloat = 7
        let cardWidth = view.frame.width / (cardCount + 1)
        let cardHeight = cardWidth * 1.27
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "card-back")

        for _ in 1...7 {
            let cardImage = UIImageView(image: image)
            stackView.addArrangedSubview(cardImage)
        }
        
        view.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: cardHeight).isActive = true
        
    }
    
    func allPlayerStackView() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(stackView)
        
        let topSpace = self.view.frame.height / self.divideYSpace + 20
        stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: topSpace).isActive = true
        //stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        
        let a = playerStackView()
        
        stackView.addArrangedSubview(a)
        
    }
    
    func playerStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = -8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
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
        game.startGame()
    }

    @IBAction func playersChanged(sender: UISegmentedControl) {
        let player = NumberOfPlayers.playerType[sender.selectedSegmentIndex]
        game.selectPlayers(numberOfPlayers: player)
        game.startGame()
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
