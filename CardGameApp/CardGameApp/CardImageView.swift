//
//  CardImageView.swift
//  CardGameApp
//
//  Created by Elena on 28/10/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

class CardImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.image = UIImage(named: setImage())
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    /// 카드 이미지
    private func setImage(named name: String? = nil) -> String {
        let name: String = name ?? "card-back"
        return name
    }
}
