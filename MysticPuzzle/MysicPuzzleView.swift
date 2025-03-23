//
//  ContentView.swift
//  MysticPuzzle
//
//  Created by mehmet Çelik on 23.03.2025.
//

import SwiftUI





struct MysicPuzzleView: View {
    
    @StateObject var mysticPuzzleViewModel = MysticPuzzleViewModel()
    let tileDim:CGFloat = 70.0
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
                    Text("Tiles")
                    Image("digit0")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.red)
                        .frame(width: tileDim, height: tileDim)
                    
                   
                }
            }
            
        }
    }
}

#Preview {
    MysicPuzzleView()
}
