//
//  FirstView.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/07.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import SnapKit
enum different {
    case two
    case three
    case four
}

final class GameTableView: UIView {
    
    // MARK: - Properties
    private var gameStyle: [String] = ["5 Cards", "7 Cards"]
    private var numberOfPlayers: [String] = ["2 peoples", "3 peoples", "4 peoples"]
    private let viewBackground: String = "bg_pattern"
    private let cardBackground: String = "card-back"
    
    private var gameStyleSegemeted: UISegmentedControl
    private var numberOfPlayersSegemented: UISegmentedControl
    
    var somea: StackView
    var something: Bool = false {
        didSet {
            changeState()
        }
    }
    var abouthing: different = .two {
        didSet {
            changeState()
        }
    }
    
    // MARK: - Lifecycles
    override init(frame: CGRect) {
        gameStyleSegemeted = UISegmentedControl(items: gameStyle)
        numberOfPlayersSegemented = UISegmentedControl(items: numberOfPlayers)
        somea = StackView(count: 3, amount: 4)
        super.init(frame: frame)
        apply(background: viewBackground)
        gameStyleSegemented()
        numberofPlayersSegemented()
        stackViewConstraint()
    }

    required init?(coder: NSCoder) {
        gameStyleSegemeted = UISegmentedControl(items: gameStyle)
        numberOfPlayersSegemented = UISegmentedControl(items: numberOfPlayers)
        somea = StackView(count: 3, amount: 4)

        super.init(coder: coder)
    }
    
    // MARK: - Handlers
    func changeState() {
        let vc = ViewController()
        vc.somethings = something
        vc.abouthing = abouthing
    }
    
    func abc(handler: (Game) -> Void) {
        
    }
    
    private func apply(background: String) {
        backgroundColor = UIColor(patternImage: UIImage(named: background) ?? UIImage())
    }
    
    @objc func some() {
        if !something {
            something.toggle()
        } else {
            something.toggle()
        }
    }
    
    @objc func somes() {
        if numberOfPlayersSegemented.selectedSegmentIndex == 0 {
            abouthing = .two
        } else if numberOfPlayersSegemented.selectedSegmentIndex == 1 {
            abouthing = .three
        } else {
            abouthing = .four
        }
    }
    
    
    func gameStyleSegemented() {
        addSubview(gameStyleSegemeted)
        gameStyleSegemeted.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide).offset(16)
            make.centerX.equalTo(self)
        }
        gameStyleSegemeted.tintColor = .white
        
        gameStyleSegemeted.selectedSegmentIndex = 0
        
        gameStyleSegemeted.addTarget(self, action: #selector(some), for: .valueChanged)

    }
    
    func numberofPlayersSegemented() {
        
        addSubview(numberOfPlayersSegemented)
                numberOfPlayersSegemented.addTarget(self, action: #selector(somes), for: .valueChanged)
        numberOfPlayersSegemented.tintColor = .white
        numberOfPlayersSegemented.selectedSegmentIndex = 0
        numberOfPlayersSegemented.snp.makeConstraints { (make) in
            make.top.equalTo(gameStyleSegemeted.snp.bottom).offset(16)
            make.leading.equalTo(gameStyleSegemeted.snp.leading)
            make.centerX.equalTo(self)
        }
    }
    
    func stackViewConstraint() {
        addSubview(somea)
        somea.snp.makeConstraints { (make) in
            make.top.equalTo(numberOfPlayersSegemented.snp.bottom).offset(16)
            make.leading.equalTo(numberOfPlayersSegemented.snp.leading)
            make.centerX.equalTo(self)
        }
    }
}
