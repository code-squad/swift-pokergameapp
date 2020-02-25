//
//  ViewController.swift
//  CardGameApp
//
//  Created by 임승혁 on 2020/02/10.
//  Copyright © 2020 임승혁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var gameStackView = GameStackView(pokerGame: GameTable())
    
    private let studTypeSegementControl = UISegmentedControl(items: ["7 Cards", "5 Cards"])
    private let playerEntrySegmentControl = UISegmentedControl(items: ["2명", "3명", "4명"])
    
    private var entry = PlayerEntry.two
    private var studType = StudType.sevenStud
    
    //status bar 설정
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundPattern")!)
        drawSegmentCtrl()
        drawStackView()
    }
    
    func resetPokerGame() {
        self.gameStackView.arrangedSubviews.forEach { (subCardStackView) in
            self.gameStackView.removeArrangedSubview(subCardStackView)
            subCardStackView.removeFromSuperview()
        }
        drawStackView()
    }
    
    func drawStackView() {
        self.gameStackView = GameStackView(pokerGame: GameTable(playerEntry: self.entry, studType: self.studType))
        self.view.addSubview(gameStackView)
        gameStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 130).isActive = true
        gameStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        gameStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
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

