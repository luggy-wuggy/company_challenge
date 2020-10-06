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
                
                List(){
                    ForEach(self.fetch.getListIdBound(), id: \.self){ index in
                        Section(header: Text("\(index)")){
                            
                            // Grouping each contents of section by the range of the listIdBound [1...MAX(listId)]
                            ForEach(self.fetch.fetchModels.filter{$0.listId == index}){ fetchModel in
                                Text(fetchModel.name!)
                            }
                            
                        }
                    }
                }.navigationBarTitle("Fetch Rewards List")
            }
        
        }
    }


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}



