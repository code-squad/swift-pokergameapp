//
//  OverlappedCardsView.swift
//  CardGameApp
//
//  Created by Chaewan Park on 2020/02/13.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class OverlappedCardsView: UIView {
    
    private lazy var overlappedCardsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = -15
        return stackView
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
    
    func updateView(with participant: Participant) {
        var subViewIndex = 0
        participant.repeatForEachCard { card in
            updateSubviewImage(at: subViewIndex, to: UIImage(named: "\(card)"))
            subViewIndex += 1
        }
        showCardView(by: subViewIndex)
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(overlappedCardsStackView)
        overlappedCardsStackView.fillSuperView()
        GamePlay.Rule.invokePerMaxParticipantNumber {
            let cardView = UIImageView(image: nil)
            cardView.translatesAutoresizingMaskIntoConstraints = false
            cardView.heightAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 1.27).isActive = true
            overlappedCardsStackView.addArrangedSubview(cardView)
        }
    }
    
    private func showCardView(by number: Int) {
        let subViewCount = overlappedCardsStackView.arrangedSubviews.count
        guard number > 0, number <= subViewCount else { return }
        (0..<number).forEach {
            overlappedCardsStackView.arrangedSubviews[$0].isHidden = false
        }
        (number..<subViewCount).forEach {
            overlappedCardsStackView.arrangedSubviews[$0].isHidden = true
        }
    }
    
    private func updateSubviewImage(at index: Int, to image: UIImage?) {
        guard let view = overlappedCardsStackView.arrangedSubviews[index] as? UIImageView else { return }
        view.image = image
    }
}

extension OverlappedCardsView {
    
    func createDealingAnimation(period: TimeInterval, speed: Double) -> (() -> Void, TimeInterval) {
        let shownViews = overlappedCardsStackView.arrangedSubviews.filter { $0.isHidden == false }
        let duration = period * Double(shownViews.count) / speed
        let animation = {
            UIView.animateKeyframes(withDuration: duration, delay: 0, animations: { [weak self] in
                self?.instantViewTransparentingAnimation(for: shownViews)
                self?.successiveDealingAnimation(for: shownViews, dutyCycle: 1 / period)
            })
        }
        return (animation, duration)
    }
    
    private func successiveDealingAnimation(for views: [UIView], dutyCycle: Double) {
        let cardAppearingDuration = 1 / Double(views.count) * dutyCycle
        var startTimes = stride(from: 0, to: 1, by: 1 / Double(views.count)).map { $0 }
        
        views.forEach { view in
            UIView.addKeyframe(withRelativeStartTime: startTimes.popFirst()!,
                               relativeDuration: cardAppearingDuration) { view.alpha = 1 }
        }
    }
    
    private func instantViewTransparentingAnimation(for views: [UIView]) {
        views.forEach { view in
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0) { view.alpha = 0 }
        }
    }
}
