//
//  UserViewModel.swift
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
import Combine

class BrewViewModel: ObservableObject {
    @Published var category: String = ""
    @Published var type: String = ""
    @Published var joke: String = ""
//    @Published var flags: Dictionary = ["awesome": "Blah"]
    @Published var safe: Bool = false
    
    func fetchBrewInfo(){
        guard let url = URL(
            string: "https://v2.jokeapi.dev/joke/Any?type=single")
        else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print("Request failed:\(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("No data returned")
                return
            }
            do {
                let brewInfo = try JSONDecoder().decode(brewModel.self, from: data)
                DispatchQueue.main.async{
                    self.category = brewInfo.category
                    self.type = brewInfo.type
                    self.joke = brewInfo.joke
//                    self.flags = brewInfo.flags
                    self.safe = brewInfo.safe


                }
            } catch {
                print ("Decoding failed: \(error)")
            }
                
        }.resume()
        
    }
}
