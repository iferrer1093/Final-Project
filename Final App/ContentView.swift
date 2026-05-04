//
//  ContentView.swift
//  Final App
//
//  Created by FERRER, ISAAC on 5/4/26.
//


//let category: String
//let type: String
//let joke: String
//
//let flags: Bool
//
//let safe: Bool

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = BrewViewModel()
    var body: some View {
        VStack (spacing: 20) {
            Text("Random Joke Generator")
                .font(.largeTitle)
                .bold()
            
            Text("category: \(viewModel.category)")
            Text("type: \(viewModel.type)")
            Text("joke: \(viewModel.joke)")
//            Text("flags: \(viewModel.flags)")
            Text("safe: \(viewModel.safe)")





            
            Button("Get New Brewery") {
                viewModel.fetchBrewInfo()
            }
            .buttonStyle(.borderedProminent)
                
            
        }
        .padding()
        .onAppear {
            viewModel.fetchBrewInfo()
        }
        .tabItem{Label("Jokes", systemImage: "face.smiling")}
    }
  
}

#Preview {
    ContentView()
}
