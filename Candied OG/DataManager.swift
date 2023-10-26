//
//  DataManager.swift
//  Candied OG
//
//  Created by Alyssa Pollard on 10/7/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore



struct Candy {
    var id: String
    var type: String
    var pound: Int
}

class DataManager: ObservableObject {
    @Published var Candies: [Candy] = []
    
    init() {
       getCandies()
    }
    
    func getCandies() {
        Candies.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Candies")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    // Extract values with default values if not present or not in expected format
                    let id = data["id"] as? String ?? " "
                    let type = data["type"] as? String ?? ""
                    let pound = data["pound"] as? Int ?? 0
                    
                    // Create a Candies object and append it to the candies array
                    let candy = Candy(id: id, type: type, pound: pound)
                    self.Candies.append(candy)
                }
            }
        }
    }
}
