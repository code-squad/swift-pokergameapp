//
//  ViewController.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/10.
//  Copyright © 2020 임승혁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var pokerGame = GameTable()
    private var gameStackView: GameStackView!
    private var winnerThropyImageView = WinnerThropyImageView(image: UIImage(named: "winnerIcon"))
    private var entry = PlayerEntry.two
    private var studType = StudType.sevenStud
    
    //status bar 설정
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundPattern")!)
        addSegmentControl()
        addStackView()
    }
    
    func addStackView() {
        gameStackView = GameStackView(pokerGame: pokerGame)
        self.view.addSubview(gameStackView)
        gameStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 130).isActive = true
        gameStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        gameStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        addWinnerThropy()
    }
    
    func addSegmentControl() {
        setUpStudTypeSegment()
        setUpPlayerEntrySegment()
    }
    
    func resetPokerGame() {
        self.gameStackView.arrangedSubviews.forEach { (subCardStackView) in
            self.gameStackView.removeArrangedSubview(subCardStackView)
            subCardStackView.removeFromSuperview()
        }
        self.pokerGame = GameTable(playerEntry: self.entry, studType: self.studType)
        addStackView()
    }
    
    func addWinnerThropy() {
        let winnerIndex = pokerGame.winner()
        self.view.addSubview(winnerThropyImageView)
        gameStackView.setWinnerThropyImage(winnerThropyImageView: winnerThropyImageView, winnerIndex: winnerIndex, studType: studType)
    }
    
    func setUpStudTypeSegment() {
        let studTypeSegmentedControl = CustomSegmentedControl(items: ["7 Cards", "5 Cards"])
        studTypeSegmentedControl.center = CGPoint(x: self.view.frame.width/2, y: 100)
       
        self.view.addSubview(studTypeSegmentedControl)
        
        studTypeSegmentedControl.addTarget(self, action: #selector(studTypeChange(handler:)), for: .valueChanged)
    }
    
    @objc func studTypeChange(handler: UISegmentedControl) {
        let studTypeArray = Array(StudType.allCases)
        self.studType = studTypeArray[handler.selectedSegmentIndex]
        resetPokerGame()
    }
    
    func setUpPlayerEntrySegment() {
        let playerEntrySegmentedControl = CustomSegmentedControl(items: ["2명", "3명", "4명"])
        playerEntrySegmentedControl.center = CGPoint(x: self.view.frame.width/2, y: 140)
        
        self.view.addSubview(playerEntrySegmentedControl)
        
        playerEntrySegmentedControl.addTarget(self, action: #selector(playerEntryChange(handler:)), for: .valueChanged)
    }
    
    @objc func playerEntryChange(handler: UISegmentedControl) {
        let entryArray = Array(PlayerEntry.allCases)
        self.entry = entryArray[handler.selectedSegmentIndex]
        resetPokerGame()
    }
}
