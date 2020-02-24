//
//  StackViewDataSource.swift
//  CardGameApp
//
//  Created by Cloud on 2020/02/24.
//  Copyright © 2020 Cloud. All rights reserved.
//

protocol StackViewDataSource {
    func stackForAt(_ fact: Bool)
    func numberOfRow(row: Int)
}

