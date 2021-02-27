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
    private var cardImages : [UIImageView] = []
    private var mainCardView : UIView = UIView() //카드 뷰를 따로 생성하고 카드를 해당 뷰에 생성한 후, 다시 호출할 떄 removeFromSuperview로 카드만 다시 지우고 그리기 위함
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        CreateCardView()
        initGameplay()
        let pokergame = PokerGame.init(GameStyle: GameStyle.init(GameStyle: 5), gamePlayers: 4)
        pokergame.gameStart()
        pokergame.showPlayersHands()
    }
    
    func initGameplay(){
        if let pattern : UIImage = UIImage(named: "bg_pattern"){
            self.view.backgroundColor = UIColor(patternImage: pattern)
        }
        else{
            print("여기가 문제임?")
        }
        initGamestyleSegcon()
        initPlayersSegcon()
    }
    
    
    @IBAction func shakeBtn(_ sender: Any) {
        print("실행함")
    }
    
    func initGamestyleSegcon(){ // 게임 스타일 세그먼트 컨트롤 초기화
        let gameStyle = ["7 Cards", "5 Cards"]
        let gamestyleSeg : UISegmentedControl = UISegmentedControl(items: gameStyle)
        gamestyleSeg.center = CGPoint(x: self.view.frame.width/2, y: 50)
        let titleTextSelected = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let titleTextNonSelected = [NSAttributedString.Key.foregroundColor: UIColor.white]
        gamestyleSeg.setTitleTextAttributes(titleTextSelected, for: .selected)
        gamestyleSeg.setTitleTextAttributes(titleTextNonSelected, for: .normal)
        //gamestyleSeg.addTarget(self, action: #selector(GameStyleControl(_:)), for: .valueChanged)
        view.addSubview(gamestyleSeg)
    }
    
    func initPlayersSegcon(){ // 게임 플레이어 수 세그먼트 컨트롤 버튼 초기화
        let players = ["2명","3명","4명"]
        let segmentPlayers : UISegmentedControl = UISegmentedControl(items: players)
        segmentPlayers.center = CGPoint(x: self.view.frame.width/2, y: 100)
        let titleTextSelected = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let titleTextNonSelected = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segmentPlayers.setTitleTextAttributes(titleTextSelected, for: .selected)
        segmentPlayers.setTitleTextAttributes(titleTextNonSelected, for: .normal)
        //segmentPlayers.addTarget(self, action: #selector(decidePlayerControl(_:)), for: .valueChanged)
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
