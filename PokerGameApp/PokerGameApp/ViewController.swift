//
//  ViewController.swift
//  PokerGameApp
//
//  Created by 박정하 on 2021/02/15.
//

import UIKit

class ViewController: UIViewController {
    private var gameStyle : GameStyle = GameStyle(GameStyle: .sevencards)
    private var players : Players.GamePlayers = .two
    private var mainCardView : UIView = UIView() //카드 뷰를 따로 생성하고 카드를 해당 뷰에 생성한 후, 다시 호출할 떄 removeFromSuperview로 카드만 다시 지우고 그리기 위함
    private var currentPokerGame : PokerGame? = nil
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUserInterface()
        let pokergame = PokerGame.init(GameStyle: gameStyle, gamePlayers: players)
        currentPokerGame = pokergame
        currentPokerGame?.initPokerGame()
    }
    
    func initUserInterface(){
        if let pattern : UIImage = UIImage(named: "bg_pattern"){
            self.view.backgroundColor = UIColor(patternImage: pattern)
        }
        initGamestyleSegcon()
        initPlayersSegcon()
        CreateCardView()
    }
    
    
    @IBAction func shakeBtn(_ sender: Any) {
        self.mainCardView.subviews.forEach{$0.removeFromSuperview()}
        if let pokergame = currentPokerGame {
            pokergame.CardShake(mainView: self.view, cardView: mainCardView)
        }
    }
    
    @objc func GameStyleControl(_ segmentControl : UISegmentedControl){
        gameStyle = GameStyle.init(GameStyle: GameStyle.stud.allCases[segmentControl.selectedSegmentIndex])
        if let pokergame = currentPokerGame {
            pokergame.setGameStyle(GameStyle: gameStyle)
        }
    }
    
    @objc func decidePlayerControl(_ segmentControl : UISegmentedControl){
        players = Players.GamePlayers.allCases[segmentControl.selectedSegmentIndex]
        if let pokergame = currentPokerGame {
            pokergame.setPlayerNumber(Players: players)
        }
    }
    
    func initGamestyleSegcon(){ // 게임 스타일 세그먼트 컨트롤 초기화
        let localgameStyle : [String] = GameStyle.stud.allCases.map{
            String($0.rawValue)+"cards"
        }
        let gamestyleSeg : UISegmentedControl = UISegmentedControl(items: localgameStyle)
        gamestyleSeg.center = CGPoint(x: self.view.frame.width/2, y: 50)
        gamestyleSeg.selectedSegmentIndex = 0
        let titleTextSelected = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let titleTextNonSelected = [NSAttributedString.Key.foregroundColor: UIColor.white]
        gamestyleSeg.setTitleTextAttributes(titleTextSelected, for: .selected)
        gamestyleSeg.setTitleTextAttributes(titleTextNonSelected, for: .normal)
        gamestyleSeg.addTarget(self, action: #selector(GameStyleControl(_:)), for: .valueChanged)
        view.addSubview(gamestyleSeg)
    }
    
    func initPlayersSegcon(){ // 게임 플레이어 수 세그먼트 컨트롤 버튼 초기화
        let players : [String] = Players.GamePlayers.allCases.map{
            String($0.rawValue)+"명"
        }
        let segmentPlayers : UISegmentedControl = UISegmentedControl(items: players)
        segmentPlayers.center = CGPoint(x: self.view.frame.width/2, y: 100)
        segmentPlayers.selectedSegmentIndex = 0
        let titleTextSelected = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let titleTextNonSelected = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segmentPlayers.setTitleTextAttributes(titleTextSelected, for: .selected)
        segmentPlayers.setTitleTextAttributes(titleTextNonSelected, for: .normal)
        segmentPlayers.addTarget(self, action: #selector(decidePlayerControl(_:)), for: .valueChanged)
        self.view.addSubview(segmentPlayers)
    }
    
    func CreateCardView(){ //카드를 놓을 뷰 생성
        let cardView : UIView = UIView.init()
        cardView.center = CGPoint(x: 0, y: 150)
        cardView.frame.size = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height)
        mainCardView = cardView
        view.addSubview(mainCardView)
    }
}
