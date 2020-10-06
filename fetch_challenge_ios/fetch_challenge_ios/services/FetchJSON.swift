//
//  FetchJson.swift
//  fetch_challenge_ios
//
//  Created by Luqman Abdurrohman on 10/2/20.
//  Copyright © 2020 Luqman Abdurrohman. All rights reserved.
//

import Foundation

/// FetchJSON encapsulates the list of [FetchModel] as well as an init function in which we make the API call to retrieve the JSON data and populate the list of [FetchModel ]
class FetchJSON: ObservableObject {
    @Published var fetchModels = [FetchModel]()
    @Published var listIdBound : ClosedRange<Int> = 0...0

    
    init() {
        let url = URL(string: "https://fetch-hiring.s3.amazonaws.com/hiring.json")!
    
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let fetchData = data {
                    let decodedData = try JSONDecoder().decode([FetchModel].self, from: fetchData)
                    
                    // Filter out any items where "name" is blank or null.
                    let filteredDecodedData = decodedData.filter{$0.name != nil && $0.name != ""}
                    DispatchQueue.main.async {
                        
                        // Sort the resulting list by ascending order of [id], so it could be filtered by [listId] when displaying in UI
                        self.fetchModels = filteredDecodedData.sorted(by: {$0.id < $1.id})
                        
                        // Find the max [listId], so the UI can dynamically display the "Sections"
                        let maxListId = self.fetchModels.map{$0.listId}.max()!
                        self.listIdBound = 1...maxListId
                        
                         
                    }
                    
                } else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
    
    func getListIdBound() -> ClosedRange<Int>{
        return self.listIdBound
    }
    
}
