//
//  MysticPuzzleViewModel.swift
//  MysticPuzzle
//
//  Created by mehmet Çelik on 23.03.2025.
//

import AVFoundation
import UIKit



import AVFoundation
var audioPlayer: AVAudioPlayer? = AVAudioPlayer()
// ViewModel
class MysticPuzzleViewModel: ObservableObject {
    @Published var mysticPuzzleModel: MysticPuzzleModel = MysticPuzzleModel(tiles: [], n: 0) {
        didSet {
            saveItems()
        }
    }
    let itemsKey = "Tile list"
    init() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems =
                try? JSONDecoder().decode(MysticPuzzleModel.self, from: data)
        else
        {
            self.createInitialItems()
            self.shuffle()
            return
        }
        self.mysticPuzzleModel = savedItems
    }
    
    func saveItems() {
        if let encodeData = try? JSONEncoder().encode( mysticPuzzleModel) {
            UserDefaults.standard.set( encodeData, forKey: itemsKey)
        }
    }
    func createInitialItems() {

        var tiles: [TileModel] = []
        tiles.append(
        TileModel(value: 1,
                  currentPoint: LEFT * 2,
                  winningPoint: LEFT * 2)
        )
        tiles.append(
        TileModel(value: 2,
                  currentPoint: LEFT * 1,
                  winningPoint: LEFT * 1)
        )
        tiles.append(
        TileModel(value: 3,
                  currentPoint: .zero,
                  winningPoint: .zero)
        )
        
        tiles.append(
        TileModel(value: 4,
                  currentPoint: RIGHT * 1,
                  winningPoint: RIGHT * 1)
        )
        tiles.append(
        TileModel(value: 5,
                  currentPoint: LEFT * 2 + DOWN,
                  winningPoint: LEFT * 2 + DOWN)
        )
        tiles.append(
        TileModel(value: 6,
                  currentPoint: LEFT * 1 + DOWN,
                  winningPoint: LEFT * 1 + DOWN)
        )
        tiles.append(
        TileModel(value: 7,
                  currentPoint: DOWN,
                  winningPoint: DOWN)
        )
        
        tiles.append(
        TileModel(value: 8,
                  currentPoint: RIGHT * 1 + DOWN,
                  winningPoint: RIGHT * 1 + DOWN)
        )
        tiles.append(
        TileModel(value: 9,
                  currentPoint: LEFT * 2 + DOWN * 2,
                  winningPoint: LEFT * 2 + DOWN * 2)
        )
        tiles.append(
        TileModel(value: 10,
                  currentPoint: LEFT * 1 + DOWN * 2,
                  winningPoint: LEFT * 1 + DOWN * 2)
        )
        tiles.append(
        TileModel(value: 11,
                  currentPoint: DOWN * 2,
                  winningPoint: DOWN * 2)
        )
        
        tiles.append(
        TileModel(value: 12,
                  currentPoint: RIGHT * 1 + DOWN * 2,
                  winningPoint: RIGHT * 1 + DOWN * 2)
        )
        tiles.append(
        TileModel(value: 13,
                  currentPoint: LEFT * 2 + DOWN * 3,
                  winningPoint: LEFT * 2 + DOWN * 3)
        )
        tiles.append(
        TileModel(value: 14,
                  currentPoint: LEFT * 1 + DOWN * 3,
                  winningPoint: LEFT * 1 + DOWN * 3)
        )
        tiles.append(
        TileModel(value: 15,
                  currentPoint: DOWN * 3,
                  winningPoint: DOWN * 3)
        )
        tiles.append(
        TileModel(value: 16,
                  currentPoint: RIGHT * 1 + DOWN * 3,
                  winningPoint: RIGHT * 1 + DOWN * 3)
        )

        let n = 4
        
        
        self.mysticPuzzleModel = MysticPuzzleModel(
            tiles: tiles,
            n: n)
    }
    func done() -> Bool {
        
        for tile in mysticPuzzleModel.tiles {
            if tile.currentPoint != tile.winningPoint {
                return false
            }
        }
        
        return true
    }
    
    // NEW DRAG
    func movable( index: Int) -> Bool {
        
        let n = mysticPuzzleModel.n
        let emptyPosition =
        mysticPuzzleModel.tiles[n*n-1].currentPoint
        
        let tilePosition = mysticPuzzleModel.tiles[index].currentPoint
        let distance = tilePosition.distanceTo( point: emptyPosition)
        
        return distance == 1
    }
   
    func move( index: Int) -> Bool {
        var result = false
        let n = mysticPuzzleModel.n
        let emptyPosition =
        mysticPuzzleModel.tiles[n*n-1].currentPoint
        
        let tilePosition = mysticPuzzleModel.tiles[index].currentPoint
        let distance = tilePosition.distanceTo( point: emptyPosition)

        if distance == 1 {
            let saveTilePoint = mysticPuzzleModel.tiles[index].currentPoint
            
            mysticPuzzleModel.tiles[index] = TileModel(
                value: mysticPuzzleModel.tiles[index].value,
                currentPoint: emptyPosition,
                winningPoint: mysticPuzzleModel.tiles[index].winningPoint)
            
            // Update empty tile position
            mysticPuzzleModel.tiles[n*n-1].currentPoint = saveTilePoint
            
            result = true
        }
        
        return result
    }
    // 1 2 3 4 5 6 8 7 9 10 11 12 13 14 15
    func shuffle() {
        // If n is even do even number of inversions
        // If n is odd do an odd number of inversions
        let n = mysticPuzzleModel.n
        for _ in 0..<n * n {
            let (i,j) = getRandomIJ(max: n * n - 1)
            let lastPosition = mysticPuzzleModel.tiles[i].currentPoint
            mysticPuzzleModel.tiles[i].currentPoint = mysticPuzzleModel.tiles[j].currentPoint
            mysticPuzzleModel.tiles[j].currentPoint = lastPosition
        }
        
    }
    
    /// Returns a pair of two different integers i and j
    /// between 0 and max (exclusive)
    /// - Parameter max: max is the maximal possible integer
    /// to be returned
    /// - Returns: Returns (i,j) where i is not equal to j
    /// and 0 <= i,j < max. If max = 1 then
    /// (1,1) is returned.
    func getRandomIJ( max: Int) -> (Int,Int) {
        if max == 1 {
            return (1,1)
        }
        let i = Int.random(in: 0..<max)
        var j: Int
        repeat {
            j = Int.random(in: 0..<max)
        } while ( i == j)
        return (i,j)
    }
}
// Play sound with default volume value
// set to 1.0
func playSound(sound: String, type: String, volume: Float = 1.0) {
            if let path = Bundle.main.path(forResource: sound, ofType: type) {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    
                    // Set volume
                    audioPlayer?.setVolume(volume, fadeDuration: 0.1)
                    
                    audioPlayer?.play()
                } catch {
                    print("ERROR")
                }
            }
        }

