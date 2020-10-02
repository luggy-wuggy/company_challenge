//
//  ContentView.swift
//  fetch_challenge_ios
//
//  Created by Luqman Abdurrohman on 10/2/20.
//  Copyright © 2020 Luqman Abdurrohman. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var fetch = FetchJSON()
    
       var body: some View {
        NavigationView{
            List(fetch.fetchModels) { fetchModels in
                HStack() {
                    Text("\(fetchModels.listId)")
                    Text("\(fetchModels.name ?? "null")") // print boolean
                        .font(.system(size: 15))
                        .foregroundColor(Color.gray)
                }
            }.navigationBarTitle(Text("Fetch Rewards List"))
        }
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



