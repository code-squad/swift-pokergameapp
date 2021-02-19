//
//  Card.swift
//  PokerGameApp
//
//  Created by Lia on 2021/02/15.
//

import Foundation

// 4가지 모양만 존재 가능하다고 명시하는 효과가 있는 것 같아서 선택
enum Shape: Character, CustomStringConvertible, CaseIterable {
    var description: String { return "\(self.rawValue)" }
    
    case Spade = "♠️"
    case Diamond = "♦️"
    case Heart = "♥️"
    case Clover = "♣️"
}

// 1-13 범위만 받을 수 있고, 숫자에 해당하는 String 값을 받을 수 있다
enum Rank: Int, CustomStringConvertible, CaseIterable {
    case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
    
    var description: String {
        switch self.rawValue {
        case 1:
            return "A"
        case 11:
            return "J"
        case 12:
            return "Q"
        case 13:
            return "K"
        default:
            return "\(self.rawValue)" }
        }
}

enum Face{
    case up
    case down
}

struct Card: CustomStringConvertible {
    private let shape: Shape
    private let rank: Rank
    var face: Face
    
    init(shape: Shape, rank: Rank, face: Face) {
        self.shape = shape
        self.rank = rank
        self.face = face
    }
    
    var description: String {
        return face == Face.up ? "\(self.shape)\(self.rank)" : "(\(self.shape)\(self.rank))"
    }
}
