//
//  GamePlayView.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/13.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class GamePlayView: UIView {
    
    private var dealAnimators = [UIViewPropertyAnimator]()
    
    private lazy var participantsStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 30
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    func updateGamePlayView(with gamePlay: GamePlay) {
        showParticipantView(by: gamePlay.participantCount)
        let names = createParticipantNames(by: gamePlay.participantCount)
        hideWinnerView(with: gamePlay)
        
        var subViewIndex = 0
        gamePlay.repeatForEachParticipant { participant in
            updateSubView(at: subViewIndex, to: participant, participantName: names[subViewIndex])
            subViewIndex += 1
        }
        animateGamePlayView(with: gamePlay, speed: 10)
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(participantsStackView)
        participantsStackView.fillSuperView()
        Players.Number.invokePerMaxParticipantNumber {
            let participantView = ParticipantView()
            participantsStackView.addArrangedSubview(participantView)
        }
    }
    
    private func showParticipantView(by number: Int) {
        let subViewCount = participantsStackView.arrangedSubviews.count
        guard number > 0, number <= subViewCount else { return }
        (0..<number).forEach {
            participantsStackView.arrangedSubviews[$0].isHidden = false
        }
        (number..<subViewCount).forEach {
            participantsStackView.arrangedSubviews[$0].isHidden = true
        }
    }
    
    private func createParticipantNames(by number: Int) -> [String] {
        var names = (1..<number).map { "\(StaticGameContents.playerLabel)\($0)" }
        names.append("\(StaticGameContents.dealerLabel)")
        return names
    }
    
    private func updateWinnerView(with gamePlay: GamePlay) {
        var subViewIndex = 0
        gamePlay.repeatForEachParticipant { participant in
            participant.informWinner { isWinner in
                updateSubView(at: subViewIndex, to: isWinner)
                subViewIndex += 1
            }
        }
    }
    
    private func hideWinnerView(with gamePlay: GamePlay) {
        var subViewIndex = 0
        gamePlay.repeatForEachParticipant { participant in
            updateSubView(at: subViewIndex, to: false)
            subViewIndex += 1
        }
    }
    
    private func updateSubView(at index: Int, to participant: Participant, participantName: String) {
        guard let view = participantsStackView.arrangedSubviews[index] as? ParticipantView else { return }
        view.updateView(name: participantName, participant: participant)
    }
    
    private func updateSubView(at index: Int, to winnerOrNot: Bool) {
        guard let view = participantsStackView.arrangedSubviews[index] as? ParticipantView else { return }
        view.updateView(to: winnerOrNot)
    }
}

extension GamePlayView {
    
    func animateGamePlayView(with gamePlay: GamePlay, speed: Double) {
        let shownViews = participantsStackView.arrangedSubviews.filter { $0.isHidden == false }
        var animations = [() -> Void]()
        var durations = [TimeInterval]()
        
        shownViews.enumerated().forEach { index, view in
            guard let view = view as? ParticipantView else { return }
            let (animation, duration) = view.createDealingAnimation(period: TimeInterval(shownViews.count),
                                                                    speed: speed)
            animations.append(animation)
            durations.append(duration)
        }
        
        dealAnimators.removeAll()
        durations.forEach { dealAnimators.append(UIViewPropertyAnimator(duration: $0, curve: .linear)) }
        dealAnimators.forEach { $0.addAnimations { animations.popFirst()!() } }
        dealAnimators.last?.addCompletion { [weak self] position in
            if position == .end {
                self?.updateWinnerView(with: gamePlay)
            }
        }
        dealAnimators.enumerated().forEach { index, animator in
            animator.startAnimation(afterDelay: TimeInterval(index) / speed)
        }
    }
    
    func stopAnimation() {
        dealAnimators.forEach { $0.stopAnimation(true) }
    }
}
