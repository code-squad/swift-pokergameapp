//
//  CardInfoStackView.swift
//  PokerGameApp
//
//  Created by Song on 2021/02/22.
//

import UIKit

class CardInfoStackView: UIStackView {
    
    private let player: Player
    private let nameLabel = UILabel()
    private var cardStackView = UIStackView()
    
    init(player: Player) {
        self.player = player
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fill
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addArrangedSubview(nameLabel)
        nameLabel.textColor = UIColor.white
        nameLabel.text = player.nickname
        
        var cardViews: [UIImageView] = []
        //showdownCards.showCards {
        //    cardViews.append(CardView(of: $0))
        //}
        cardStackView = makeCardStackView(with: cardViews)
        self.addArrangedSubview(cardStackView)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeCardStackView(with cardViews: [UIImageView]) -> UIStackView {
        let cardStackView = UIStackView()
        cardViews.forEach { cardStackView.addArrangedSubview($0) }
        cardStackView.spacing = -10.0
        return cardStackView
    }
}
