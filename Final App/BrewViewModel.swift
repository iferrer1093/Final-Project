//
//  UserViewModel.swift
//  Final App
//
//  Created by FERRER, ISAAC on 5/4/26.
//

//let gender: String
//let name: String
//let location: String
//let email: String

import SwiftUI
import Combine

class UserViewModel: ObservableObject {
    @Published var gender: String = ""
    @Published var name: String = ""
    @Published var location: String = ""
    @Published var email: String = ""
    
    
    func fetchUserInfo(){
        guard let url = URL(
            string: "https://randomuser.me/api/")
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
                let userInfo = try JSONDecoder().decode(personModel.self, from: data)
                DispatchQueue.main.async{
                    self.gender = userInfo.gender
                    self.name = userInfo.name
                    self.location = userInfo.location
                    self.email = userInfo.email
                }
            } catch {
                print ("Decoding failed: \(error)")
            }
                
        }.resume()
        
    }
}
