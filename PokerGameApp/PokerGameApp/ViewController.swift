//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 박정하 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    private var gameStyle : Int = 0
    private var players : Int = 0
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGameplay()
    }
    
    func initGameplay(){
        let pattern : UIImage = UIImage(named: "bg_pattern")!
        self.view.backgroundColor = UIColor(patternImage: pattern)
        initGamestyleSegcon()
        initPlayersSegcon()
    }
    
    @objc func GameStyleControl(_ segmentControl : UISegmentedControl){
        switch (segmentControl.selectedSegmentIndex) {
        case 0:
            self.gameStyle = 7
            drawCardinView()
            break;
        case 1:
            self.gameStyle = 5
            drawCardinView()
            break;
        default:
            break;
        }
    }
    
    @objc func decidePlayerControl(_ segmentControl : UISegmentedControl){
        switch (segmentControl.selectedSegmentIndex) {
        case 0:
            self.players = 2
            drawCardinView()
            break;
        case 1:
            self.players = 3
            drawCardinView()
            break;
        case 2:
            self.players = 4
            drawCardinView()
        default:
            break;
        }
    }
    
    func initGamestyleSegcon(){
        let gameStyle = ["7 Cards", "5 Cards"]
        let gamestyleSeg : UISegmentedControl = UISegmentedControl(items: gameStyle)
        gamestyleSeg.center = CGPoint(x: self.view.frame.width/2, y: 50)
        let titleTextSelected = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let titleTextNonSelected = [NSAttributedString.Key.foregroundColor: UIColor.white]
        gamestyleSeg.setTitleTextAttributes(titleTextSelected, for: .selected)
        gamestyleSeg.setTitleTextAttributes(titleTextNonSelected, for: .normal)
        gamestyleSeg.addTarget(self, action: #selector(GameStyleControl(_:)), for: .valueChanged)
        view.addSubview(gamestyleSeg)
    }
    
    func initPlayersSegcon(){
        let players = ["2명","3명","4명"]
        let segmentPlayers : UISegmentedControl = UISegmentedControl(items: players)
        segmentPlayers.center = CGPoint(x: self.view.frame.width/2, y: 100)
        let titleTextSelected = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let titleTextNonSelected = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segmentPlayers.setTitleTextAttributes(titleTextSelected, for: .selected)
        segmentPlayers.setTitleTextAttributes(titleTextNonSelected, for: .normal)
        segmentPlayers.addTarget(self, action: #selector(decidePlayerControl(_:)), for: .valueChanged)
        self.view.addSubview(segmentPlayers)
    }
    
    func drawCardinView(){
        let game = PokerGame.init(GameStyle: self.gameStyle, gamePlayers: self.players) //게임 스타일 결정
        game.gameStart()
        for i in 0..<game.drawCard().count{
            view.addSubview(game.drawCard()[i])
        }
    }
}
