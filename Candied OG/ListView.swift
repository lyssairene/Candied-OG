//
//  ListView.swift
//  Candied OG
//
//  Created by Alyssa Pollard on 10/7/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        NavigationView {
            //List(DataManager.candies, id: \.id){ candies in
                //Text(candies.type)
                
            }
            .navigationTitle("Candies")
            .navigationBarItems(trailing: Button(action: {
                //add
            }, label: {
                Image(systemName:"plus")
            }))
        }
    }
//}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(DataManager())
    }
}
