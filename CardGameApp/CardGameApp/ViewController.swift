//
//  ViewController.swift
//  CardGameApp
//
//  Created by jinie on 2020/02/11.
//  Copyright © 2020 jinie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private var studControl: UISegmentedControl!
    private var playersControl: UISegmentedControl!
    private var allStackView: UIStackView!
    private var poker: Poker!
    private var stud: Poker.Stud = .sevenCard
    private var numberOfPlayers: Poker.NumberOfPlayers = .two

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_pattern")!)
        displayControl()
        setUpPlay()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake { setUpPlay() }
    }
    
    @objc private func studControlAction() {
        let segments: [Poker.Stud] = [.sevenCard, .fiveCard]
        stud = segments[studControl.selectedSegmentIndex]
        setUpPlay()
    }
    
    @objc private func playersControlAction() {
        let segments: [Poker.NumberOfPlayers] = [.two, .three, .four]
        numberOfPlayers = segments[playersControl.selectedSegmentIndex]
        setUpPlay()
    }
    
    private func displayControl() {
        studControl = UISegmentedControl(items: ["7 Cards", "5 Cards"])
        studControl.frame = CGRect(x: (self.view.frame.width / 3), y: 60, width: (self.view.frame.width / 3), height: 30)
        studControl.customizeAppearance()
        studControl.addTarget(self, action: #selector(studControlAction), for: .valueChanged)
        playersControl = UISegmentedControl(items: ["2명", "3명", "4명"])
        playersControl.frame = CGRect(x: (self.view.frame.width / 3), y: 100, width: (self.view.frame.width / 3), height: 30)
        playersControl.customizeAppearance()
        playersControl.addTarget(self, action: #selector(playersControlAction), for: .valueChanged)
        self.view.addSubview(studControl)
        self.view.addSubview(playersControl)
    }
    
    private func cardStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = -10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func horizontalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func verticalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.tag = 100
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func addPlayersCardsView() {
        numberOfPlayers.forEach { playerIndex in
            let stackView = horizontalStackView()
            let cardViews = cardStackView()
            stud.forEach { cardIndex in
                let card = poker.playersCards()[playerIndex][cardIndex]
                let cardView = UIImageView(image: UIImage(named: String(describing: card)))
                cardViews.addArrangedSubview(cardView)
                cardView.heightAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 1.27).isActive = true
            }
            let medalView = UIImageView(image: UIImage(named: "medal"))
            medalView.tag = playerIndex + 1
            medalView.alpha = 0
            stackView.addArrangedSubview(cardViews)
            stackView.addArrangedSubview(medalView)
            medalView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            medalView.heightAnchor.constraint(equalToConstant: 30).isActive = true
            let label = UILabel()
            label.text = "Player\(playerIndex + 1)"
            label.textColor = .white
            allStackView.addArrangedSubview(label)
            allStackView.addArrangedSubview(stackView)
        }
    }
    
    private func addDealerCardsView() {
        let stackView = horizontalStackView()
        let cardViews = cardStackView()
        stud.forEach { cardIndex in
            let card = poker.dealerCards()[cardIndex]
            let cardView = UIImageView(image: UIImage(named: String(describing: card)))
            cardViews.addArrangedSubview(cardView)
            cardView.heightAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 1.27).isActive = true
        }
        let medalView = UIImageView(image: UIImage(named: "medal"))
        medalView.tag = numberOfPlayers.rawValue + 1
        medalView.alpha = 0
        stackView.addArrangedSubview(cardViews)
        stackView.addArrangedSubview(medalView)
        medalView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        medalView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        let label = UILabel()
        label.text = "Dealer"
        label.textColor = .white
        allStackView.addArrangedSubview(label)
        allStackView.addArrangedSubview(stackView)
    }
    
    private func setUpPlay() {
        self.view.viewWithTag(100)?.removeFromSuperview()
        allStackView = verticalStackView()
        poker = Poker(stud: stud, numberOfPlayers: numberOfPlayers)
        poker.start()
        addPlayersCardsView()
        addDealerCardsView()
        self.view.addSubview(allStackView)
        allStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160.0).isActive = true
        allStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40.0).isActive = true
        allStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40.0).isActive = true
        decideWinner()
    }
    
    private func allRankCount() -> [[Card.Rank : Int]] {
        var allCards = poker.playersCards()
        allCards.append(poker.dealerCards())
        var allRankCount = [[Card.Rank : Int]]()
        for cards in allCards {
            let ranks = cards.map { $0.rank }
            let rankCount = Dictionary(ranks.map { ($0, 1) }, uniquingKeysWith: +)
            allRankCount.append(rankCount)
        }
        return allRankCount
    }
    
    private func isStraight(_ rankCount: [Card.Rank : Int]) -> Bool {
        let sortedRankCount = rankCount.sorted { $0.key < $1.key }
        var result = 0
        for index in 0..<sortedRankCount.count - 1 {
            let currentRank = sortedRankCount[index].key
            let nextRank = sortedRankCount[index + 1].key
            if Card.Rank.isNext(previous: currentRank, next: nextRank) {
                result += 1
            } else {
                result = 0
            }
        }
        return result >= 4 ? true : false
    }
    
    private func judgeHand(with rankCount: [Card.Rank : Int]) -> Poker.Hand {
        let maxCount = rankCount.max(by: { a, b in a.value < b.value })!.value
        var hand: Poker.Hand = .highCard
        switch maxCount {
        case 2:
            let filtered = rankCount.filter { $0.value == 2 }
            if filtered.count == 1 {
                if isStraight(rankCount) {
                    hand = .straight
                } else {
                    hand = .onePair
                }
            } else {
                hand = .twoPair
            }
        case 3:
            hand = .threeOfAKind
        case 4:
            hand = .fourOfAKind
        default:
            if isStraight(rankCount) { hand = .straight }
        }
        return hand
    }
    
    private func judgeHands() -> [Poker.Hand] {
        let rankCounts = allRankCount()
        var hands = [Poker.Hand]()
        for rankCount in rankCounts {
            let hand = judgeHand(with: rankCount)
            hands.append(hand)
        }
        return hands
    }
    
    private func highestRankOfStraight(with rankCount: [Card.Rank : Int]) -> Card.Rank {
        let sortedRankCount = rankCount.sorted { $0.key < $1.key }
        var nextRanks = [Card.Rank]()
        var nextRanksIndex = 0
        for index in 0..<sortedRankCount.count - 1 {
            let currentRank = sortedRankCount[index].key
            let nextRank = sortedRankCount[index + 1].key
            if Card.Rank.isNext(previous: currentRank, next: nextRank) {
                nextRanks.append(nextRank)
                nextRanksIndex += 1
            } else {
                nextRanks = []
                nextRanksIndex = 0
            }
        }
        return nextRanks[nextRanksIndex - 1]
    }
    
    private func compareRank(with data: [(index: Int, rank: Card.Rank)]) -> Int {
        let winner = data.max { a, b in a.rank < b.rank }!
        return winner.index
    }
    
    private func judgeWinner(with hands: [Poker.Hand]) -> Int {
        let highestHand = hands.max()!
        let rankCounts = allRankCount()
        let handValues: [Poker.Hand : Int] = [.onePair: 2, .twoPair: 2, .threeOfAKind: 3, .fourOfAKind: 4]
        var finalRecord = [(index: Int, rank: Card.Rank)]()
        if hands.filter({ $0 == highestHand }).count == 1 {
            return hands.firstIndex(of: highestHand)!
        } else {
            for index in 0..<hands.count {
                guard hands[index] == highestHand else { continue }
                if highestHand == .straight {
                    let rank = highestRankOfStraight(with: rankCounts[index])
                    finalRecord.append((index, rank))
                } else {
                    let ranks = rankCounts[index].filter { $0.value == handValues[highestHand] }
                    let rank = ranks.max { a, b in a.key < b.key }!.key
                    finalRecord.append((index, rank))
                }
            }
            return compareRank(with: finalRecord)
        }
    }
    
    private func awardMedal(to winner: Int) {
        self.view.viewWithTag(winner + 1)?.alpha = 1
    }
    
    private func decideWinner() {
        let hands = judgeHands()
        let winner = judgeWinner(with: hands)
        awardMedal(to: winner)
    }

}

extension UISegmentedControl {
    func customizeAppearance() {
        self.selectedSegmentIndex = 0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
    }
}
