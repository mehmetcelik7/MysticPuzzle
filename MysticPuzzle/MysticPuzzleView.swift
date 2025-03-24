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
    let newGamePrompt = "New Game"
    let shufflePrompt = "Shuffle"
    let easyGamePromt = "Easy Game"
    var body: some View {
     
        ZStack {
            Image("WaterBackground")
                .opacity(0.9).ignoresSafeArea()
            
            VStack {
               
                
                ChalkboardTextView(text: title, size: 42, color: .white)
                
                ZStack {
                  
                    let last = mysticPuzzleViewModel.mysticPuzzleModel.tiles.count-1
                    ForEach(0..<last,id: \.self) { index in
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
                
                HStack {
                    Button(
                        action: {
                            mysticPuzzleViewModel.createInitialItems()
                            mysticPuzzleViewModel.shuffle()
                        },
                        label: {
                            ChalkboardTextView(
                                text:mysticPuzzleViewModel.done() ? newGamePrompt : shufflePrompt,
                                size: 24,
                                color: .yellow
                            )
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.yellow,lineWidth: 3)
                            )
                            .padding(.vertical)
                        })
                    Button(
                        action: {
                            mysticPuzzleViewModel.createInitialItems()
                            mysticPuzzleViewModel.shuffle()
                        },
                        label: {
                            ChalkboardTextView(
                                text: easyGamePromt,
                                size: 24,
                                color: .green
                            )
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.yellow,lineWidth: 3)
                            )
                            .padding(.vertical)
                        })
                    
                    
                }
               
                
            }
            
        }
    }
}


struct ChalkboardTextView: View {
    let text: String
    let size: CGFloat
    let color: Color
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .font(Font.custom("ChalkboardSE-Bold", size: size))
            .fontWeight(.bold)
            .foregroundColor(color)
            .shadow(color: color, radius: 1)
    }
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


#Preview {
    MysticPuzzleView()
}
