//
//  ContentView.swift
//  MysticPuzzle
//
//  Created by mehmet Çelik on 23.03.2025.
//

import SwiftUI





struct MysticPuzzleView: View {
    
    @StateObject var mysticPuzzleViewModel = MysticPuzzleViewModel()
    let tileDimensions:CGFloat = 70.0
    let title = "Mystic Puzzle"
    var body: some View {
     
        ZStack {
            
            Color(.blue).opacity(0.3).ignoresSafeArea()
            
            VStack {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                
                ZStack {
                    let tiles = mysticPuzzleViewModel.mysticPuzzleModel.tiles
                    
                    ForEach(tiles) { tile in
                       
                        TileView(tileNumber: tile.value, tileDimensions: tileDimensions, offset: tile.currentPoint)
                    }
                
                   
                }
                .frame(maxWidth: tileDimensions * 4, maxHeight: tileDimensions * 4)
                .background(.blue.opacity(0.5))
                .shadow(color: .blue.opacity(0.5), radius: 10,x: 3, y: 3)
                .cornerRadius(20)
                .padding()
                .padding(.vertical)
            }
            
        }
    }
}

#Preview {
    MysticPuzzleView()
}

struct TileView: View {
    let tileNumber: Int
    let tileDimensions:CGFloat
    let offset:CGPoint
    let somePadding : CGFloat = 3
    let digitResizeFactor: CGFloat = 2 / 5
    
    var body: some View {
        let direction = offset * tileDimensions
        
        let deltaX = direction.x + tileDimensions / 2
        let deltaY = direction.y - 3 * tileDimensions / 2
        
        
        Image( "digit\(tileNumber)")
            .resizable()
            .renderingMode(.template)
            .foregroundColor(.red)
            .aspectRatio(contentMode: .fit)
            .frame(width: tileDimensions * 0.8 , height: tileDimensions * 0.8 )
            .padding()
            .background(
              Image("MarbleTileBackground")
                    .resizable()
                    .frame(width: tileDimensions - somePadding,height: tileDimensions - somePadding)
                    .cornerRadius(10)
            )
            .offset(x: deltaX, y: deltaY)
            .shadow(color: .black, radius: 1 , x: 1, y :1 )
    }
}
