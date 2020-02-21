//
//  ViewController.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/10.
//  Copyright © 2020 임승혁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var GameStackView = UIStackView()
    private let cardRatio = CGFloat(1.27)
    private let cardCount = 7
    
    private let studTypeSegementControl = UISegmentedControl(items: ["7 Cards", "5 Cards"])
    private let playerEntrySegmentControl = UISegmentedControl(items: ["2명", "3명", "4명"])
    
    private var cardDeck = CardDeck()
    private var entry = PlayerEntry.two
    private var studType = StudType.sevenStud
    
    private var pokerGame = GameTable()
    
    //status bar 설정
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    // 스택뷰 하나 생성(horizontal) -> 카드를 studType만큼 집어넣음 -> 한개 플레이어 스택 뷰 완성
    // 스택뷰 하나 생성(vertical)   -> 플레이어 엔트리만큼 플레이어 카드스텍뷰를 하나씩 집어넣음
    
    // 세그먼트 변경시 포커게임 객체를 다시 생성하고
    // 스택뷰들을 다시 걷어내고 뷰를 entry와 studType에 맞게 다시 그려줌
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundPattern")!)
        drawSegmentCtrl()
        resetPokerGame()
    }
    
    func resetPokerGame() {
        self.pokerGame = GameTable(playerEntry: self.entry, studType: self.studType)
        self.GameStackView.arrangedSubviews.forEach { (subCardStackView) in
            self.GameStackView.removeArrangedSubview(subCardStackView)
            subCardStackView.removeFromSuperview()
        }
        drawStackView()
        GameStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        GameStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    }
    
    func drawStackView() {
        self.GameStackView = createStackView(axis: .vertical, spacing: 40)
        for _ in pokerGame.players {
            let cardStackView = createStackView(axis: .horizontal, spacing: -5)
            self.studType.each {
                addCardOnStackView(stackView: cardStackView)
            }
            self.GameStackView.addArrangedSubview(cardStackView)
        }
        addStackViewOnView(stackView: GameStackView)
    }
    
    // stackview 유동적으로 생성해주도록 해야한다.
    func createStackView(axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.distribution = .fill
        stackView.spacing = spacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }
    
    // view에 stackview를 올림
    func addStackViewOnView(stackView: UIStackView) {
        self.view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
    }
    
    // stackview에 card이미지 삽입(카드 이미지 비율도 함께 조정)
    func addCardOnStackView(stackView: UIStackView) {
        let cardImg = UIImageView(image: UIImage(named: "CardBackground")!)
        cardImg.translatesAutoresizingMaskIntoConstraints = false
        cardImg.heightAnchor.constraint(equalTo: cardImg.widthAnchor, multiplier: cardRatio).isActive = true
        
        stackView.addArrangedSubview(cardImg)
    }
    
    func drawSegmentCtrl() {
        setUpStudTypeSegment()
        setUpPlayerEntrySegment()
    }
    
    func setUpStudTypeSegment() {
        self.studTypeSegementControl.center = CGPoint(x: self.view.frame.width/2, y: 100)
        self.studTypeSegementControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        self.studTypeSegementControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        self.studTypeSegementControl.layer.borderWidth = 1
        self.studTypeSegementControl.layer.borderColor = UIColor.white.cgColor
        self.studTypeSegementControl.selectedSegmentIndex = 0
        self.view.addSubview(studTypeSegementControl)
        
        self.studTypeSegementControl.addTarget(self, action: #selector(studTypeChange(handler:)), for: .valueChanged)
    }
    
    @objc func studTypeChange(handler: UISegmentedControl) {
        let studTypeArray = Array(StudType.allCases)
        self.studType = studTypeArray[handler.selectedSegmentIndex]
        resetPokerGame()
    }
    
    func setUpPlayerEntrySegment() {
        self.playerEntrySegmentControl.center = CGPoint(x: self.view.frame.width/2, y: 140)
        self.playerEntrySegmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        self.playerEntrySegmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        self.playerEntrySegmentControl.layer.borderWidth = 1
        self.playerEntrySegmentControl.layer.borderColor = UIColor.white.cgColor
        self.playerEntrySegmentControl.selectedSegmentIndex = 0
        self.view.addSubview(playerEntrySegmentControl)
        
        self.playerEntrySegmentControl.addTarget(self, action: #selector(playerEntryChange(handler:)), for: .valueChanged)
    }
    
    @objc func playerEntryChange(handler: UISegmentedControl) {
        let entryArray = Array(PlayerEntry.allCases)
        self.entry = entryArray[handler.selectedSegmentIndex]
        resetPokerGame()
    }
}

