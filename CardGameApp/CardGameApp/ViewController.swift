//
//  ViewController.swift
//  CardGameApp
//
//  Created by joon-ho kil on 7/12/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var cardGame = CardGame()
    var participants = [Participant]()
    var subviews = [UIView]()
    
    @IBOutlet weak var menuSegemnt: UISegmentedControl!
    @IBOutlet weak var playerCountSegent: UISegmentedControl!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern")!)
        self.becomeFirstResponder()
        
        cardGamePlay()
    }
    
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            removeSubview()
            cardGamePlay()
        }
    }
    
    private func removeSubview() {
        for view in subviews {
            view.removeFromSuperview()
        }
        
        cardGame.gameEnd()
    }
    
    private func showCards() {
        for (index, player) in participants.enumerated() {
            showCardsPerParticipant(index, player)
        }
    }
    
    private func showCardsPerParticipant(_ order: Int,_ participant: Participant) {
        let menuIndex = menuSegemnt.selectedSegmentIndex+1
        let menu = Menu.init(rawValue: menuIndex)!
        let champion = cardGame.getChanpion()

        participant.showCard(0) { (name, cardImageName) in
            let label = UILabel(frame: CGRect(x: 10, y: 180+order*100, width: 200, height: 21))
            label.text = name
            label.textColor = UIColor.white
            self.view.addSubview(label)
            subviews.append(label)
            
            if champion.1 == name {
                showChampionMark(order)
            }
        }
        
        for index in 0..<menu.getCardCount() {
            participant.showCard(index) { (name, cardImageName) in
                let coordinateX = Double(10 + 47 * index)
                let coordinateY = Double(200 + 100 * order)

                let image: UIImage = UIImage(named: cardImageName)!
                let imageView = UIImageView(image: image)

                self.view.addSubview(imageView)
                imageView.frame = CGRect(x: Double(coordinateX), y: coordinateY, width: 50.0, height: 63.5)
                subviews.append(imageView)
            }
        }
    }
    
    private func showChampionMark(_ order: Int) {
        let coordinateX = Double(10 + 47 * 7 + 20)
        let coordinateY = Double(200 + 100 * order)
        
        let image: UIImage = UIImage(named: "gold-medal.png")!
        let imageView = UIImageView(image: image)
        
        self.view.addSubview(imageView)
        imageView.frame = CGRect(x: Double(coordinateX), y: coordinateY, width: 50.0, height: 50.0)
        subviews.append(imageView)
    }
    
    @IBAction func changeSegment(_ sender: UISegmentedControl) {
        removeSubview()
        cardGamePlay()
        
    }
    
    private func cardGamePlay() {
        let menuIndex = menuSegemnt.selectedSegmentIndex+1
        let menu = Menu.init(rawValue: menuIndex)!
        let userCountIndex = playerCountSegent.selectedSegmentIndex+2
        let userCount = UserCount.init(rawValue: userCountIndex)!
        
        do {
            let participant = try cardGame.executeMenu(menu, userCount)
            participants = participant.0
            participants.append(participant.1)
            
            showCards()
        }
        catch let error as InputError
        {
            let alert = UIAlertController(title: "오류", message: error.localizedDescription, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "닫기", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        catch {
            
        }
    }
}

