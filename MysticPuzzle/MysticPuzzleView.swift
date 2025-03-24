//
//  ContentView.swift
//  MysticPuzzle
//
//  Created by mehmet Çelik on 23.03.2025.
//

import SwiftUI





struct MysticPuzzleView: View {
    
    @StateObject var mysticPuzzleViewModel : MysticPuzzleViewModel = MysticPuzzleViewModel()
    let tileDimensions:CGFloat = 70.0
    let title = "Mystic Puzzle"
    var body: some View {
     
        ZStack {
            Image("WaterBackground")
                .opacity(0.9).ignoresSafeArea()
            
            VStack {
                Text(title)
                    .font(.largeTitle)
                    .font(Font.custom("ChalkboardSE-Bold", size: 42))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                ZStack {
                  
                    let last = mysticPuzzleViewModel.mysticPuzzleModel.count-1
                    ForEach(0..<last) { index in
                        let tile = mysticPuzzleViewModel.mysticPuzzleModel.tiles[index]
                        TileView(tileNumber: tile.value, tileDimensions: tileDimensions, offset: tile.currentPoint)
                            .onTapGesture {
                                withAnimation(.easeOut(duration: 0.2)) {
                                    if mysticPuzzleViewModel.move(index: index) {
                                        print("move tile!")
                                    }
                                }
                            }
                           
                        
                    }
                  
                }
                .frame(maxWidth: tileDimensions * 4, maxHeight: tileDimensions * 4)
                .padding()
                .background(
                    Image("BlueMarbleBackground")
                        .resizable()
                        .opacity(0.9)
                        
                )
                .cornerRadius(20)
                .padding()
                .padding(.vertical)
                .shadow(color: .black, radius: 10,x: 3, y: 3)
                
                Button(action: {
                    mysticPuzzleViewModel.createInitialItems()
                    mysticPuzzleViewModel.shuffle()
                }, label: {
                    Text("Shuffle ")
                        .font(.largeTitle)
                        .font(Font.custom("ChalkboardSE-Bold", size: 42))
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                })
               
                
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
    let digitResizeFactor: CGFloat = 0.8
    
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
                .scaleEffect(tileNumber < 10  || tileNumber == 11 ? 0.8 : 1)
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
