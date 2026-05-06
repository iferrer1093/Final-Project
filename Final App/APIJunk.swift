//
//  API Info.swift
//  Final App
//
//  Created by FERRER, ISAAC on 5/4/26.
//

import SwiftUI

struct APIJunk: View {
    var body: some View {
        ScrollView {
            VStack(){
                Text("JokeAPI")
                Text("https://v2.jokeapi.dev/")
                Text("Isaac Ferrer")
            }
            
        }
        .navigationTitle("About")
    }
        
}

#Preview {
    APIJunk()
}
