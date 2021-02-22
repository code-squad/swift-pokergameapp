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
        CreateCardView()
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

    @IBAction func shakeBtn(_ sender: Any) {
        print("실행함")
        drawCardinView()
    }
    
    func initGamestyleSegcon(){ // 게임 스타일 세그먼트 컨트롤 초기화
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
    
    func initPlayersSegcon(){ // 게임 플레이어 수 세그먼트 컨트롤 버튼 초기화
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
    
    func CreateCardView(){ //카드를 놓을 뷰 생성
        let cardView : UIView = UIView.init()
        cardView.center = CGPoint(x: 0, y: 150)
        cardView.frame.size = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height)
        mainCardView = cardView
        view.addSubview(mainCardView)
    }
    
    func drawCardinView(){
        self.mainCardView.subviews.forEach{$0.removeFromSuperview()}
        let game = PokerGame.init(GameStyle: self.gameStyle, gamePlayers: self.players) //게임 스타일 결정
        var cardname : String = ""
        let CARDXPOS : CGFloat = self.view.frame.width/CGFloat(gameStyle)
        let CARDYPOS : CGFloat = 150
        let OFFSETCENTER : Int = gameStyle/2 + 1
        let OFFSET : CGFloat = CGFloat(self.view.frame.size.width/2) - CGFloat(Int(self.view.frame.width)/gameStyle * OFFSETCENTER) + CGFloat((Int(self.view.frame.width)/(self.gameStyle+1))/2)
        let CARDWIDTH : CGFloat = self.view.frame.size.width/(CGFloat(gameStyle) + 1)
        let CARDHEIGHT : CGFloat = CARDWIDTH * 1.27
        game.gameStart()
        for i in 0..<(self.players){
            for j in 0..<(self.gameStyle){
                cardname = game.drawCard(playerindex: i, cardindex: j) // model에서 생성한 카드의 이름 순서대로 반환
                let cardView : UIImageView = UIImageView(image: UIImage(named: cardname))
                self.cardImages.append(cardView)
                cardView.frame = CGRect(x: CARDXPOS * CGFloat(j) - OFFSET, y: CGFloat(i) * CGFloat(CGFloat(i)+CARDYPOS), width: CARDWIDTH, height: CARDHEIGHT)
                mainCardView.addSubview(cardView)
            }
        }
    }
}
