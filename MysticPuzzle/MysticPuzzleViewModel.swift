//
//  MysticPuzzleViewModel.swift
//  MysticPuzzle
//
//  Created by mehmet Çelik on 23.03.2025.
//

import AVFoundation


class MysticPuzzleViewModel: ObservableObject {
    @Published var mysticPuzzleModel: MysticPuzzleModel = MysticPuzzleModel(tiles: [], n: 0)
    
    init() {
        self.createInitialItems()
        self.shuffle()
    }
    
    //TODO:
    func createInitialItems() {
        var tiles: [TileModel] = []
       
        tiles
            .append(
                TileModel(
                    value: 1,
                    currentPoint: LEFT * 2,
                    winningPoint: LEFT * 2
                )
            )
        tiles
            .append(
                TileModel(
                    value: 2,
                    currentPoint: LEFT * 1,
                    winningPoint: LEFT * 1
                )
            )
        tiles
            .append(
                TileModel(
                    value: 3,
                    currentPoint: .zero,
                    winningPoint: .zero
                )
            )
        
        tiles
            .append(
                TileModel(
                    value: 4,
                    currentPoint: RIGHT * 1,
                    winningPoint: RIGHT * 1
                )
            )
        tiles
            .append(
                TileModel(
                    value: 5,
                    currentPoint: LEFT * 2 + DOWN,
                    winningPoint: LEFT * 2 + DOWN
                )
            )
        tiles
            .append(
                TileModel(
                    value: 6,
                    currentPoint: LEFT * 1 + DOWN,
                    winningPoint: LEFT * 1 + DOWN
                )
            )
        tiles
            .append(
                TileModel(
                    value: 7,
                    currentPoint: DOWN,
                    winningPoint: DOWN
                )
            )
        
        tiles
            .append(
                TileModel(
                    value: 8,
                    currentPoint: RIGHT * 1 + DOWN,
                    winningPoint: RIGHT * 1 + DOWN
                )
            )
        tiles
            .append(
                TileModel(
                    value: 9,
                    currentPoint: LEFT * 2 + DOWN * 2,
                    winningPoint: LEFT * 2 + DOWN * 2
                )
            )
        tiles
            .append(
                TileModel(
                    value: 10,
                    currentPoint: LEFT * 1 + DOWN * 2,
                    winningPoint: LEFT * 1 + DOWN * 2
                )
            )
        tiles
            .append(
                TileModel(
                    value: 11,
                    currentPoint: DOWN * 2,
                    winningPoint: DOWN * 2
                )
            )
        
        tiles
            .append(
                TileModel(
                    value: 12,
                    currentPoint: RIGHT * 1 + DOWN * 2,
                    winningPoint: RIGHT * 1 + DOWN * 2
                )
            )
        tiles
            .append(
                TileModel(
                    value: 13,
                    currentPoint: LEFT * 2 + DOWN * 3,
                    winningPoint: LEFT * 2 + DOWN * 3
                )
            )
        tiles
            .append(
                TileModel(
                    value: 14,
                    currentPoint: LEFT * 1 + DOWN * 3,
                    winningPoint: LEFT * 1 + DOWN * 3
                )
            )
        tiles
            .append(
                TileModel(
                    value: 15,
                    currentPoint: DOWN * 3,
                    winningPoint: DOWN * 3
                )
            )
        tiles
            .append(
                TileModel(
                    value: 16,
                    currentPoint: RIGHT * 1 + DOWN * 3,
                    winningPoint: RIGHT * 1 + DOWN * 3
                )
        )
        
        
        let n = 4
        self.mysticPuzzleModel = MysticPuzzleModel(tiles: tiles, n: n)
    }
    func shuffle() {
        
    }
}
