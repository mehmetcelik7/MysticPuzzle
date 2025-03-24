//
//  MysticPuzzleModel.swift
//  MysticPuzzle
//
//  Created by mehmet Çelik on 23.03.2025.
//

import SwiftUI

/// The TileModel models a tile. It has a value which is between 1 and 15 for the 15 puzzle
/// The currentPoint describes where is the tile currently located.
/// The winningPoint describes the  position the tile is striving reach.
/// The goal is to move all tiles to the position
/// 1 2 3 4
/// 5 6 7 8
/// 9 10 11 12
/// 13 14 15
/// In suca a situation all of the tiles are at their winning points and game is over

struct TileModel: Identifiable, Codable  {
    let id: UUID
    let value: Int
    var currentPoint: CGPoint
    let winningPoint: CGPoint
    
    init(id: UUID = UUID(), value: Int, currentPoint: CGPoint, winningPoint: CGPoint) {
        self.id = id
        self.value = value
        self.currentPoint = currentPoint
        self.winningPoint = winningPoint
    }
}

struct MysticPuzzleModel: Identifiable, Codable {
    let id: UUID
    var tiles: [TileModel]
    let n: Int
    
    init(id: UUID = UUID(), tiles: [TileModel], n: Int) {
        self.id = id
        self.tiles = tiles
        self.n = n
    }
}

let LEFT = CGPoint(x: -1, y: 0)
let RIGHT = CGPoint(x: 1, y: 0)
let UP = CGPoint(x: 0, y: -1)
let DOWN = CGPoint(x: 0, y: 1)

