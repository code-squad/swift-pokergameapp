//
//  StackViewDataSource.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/24.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

protocol StackViewDataSource: NSObject {
    func stackForAt(_ fact: Bool)
    func numberOfRow(selectedItem: Int)
}

protocol Playable {
    func pushPlayerToView(handler: (Player) -> Void)
}

