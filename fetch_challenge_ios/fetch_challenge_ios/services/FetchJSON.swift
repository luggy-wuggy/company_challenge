//
//  FetchJson.swift
//  fetch_challenge_ios
//
//  Created by Luqman Abdurrohman on 10/2/20.
//  Copyright © 2020 Luqman Abdurrohman. All rights reserved.
//

import Foundation

/// FetchJSON encapsulates the list of [FetchModel] as well as the function in which we make the API call to retrieve the JSON data
class FetchJSON: ObservableObject {
  @Published var fetchModels = [FetchModel]()
    init() {
        let url = URL(string: "https://fetch-hiring.s3.amazonaws.com/hiring.json")!
    
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    let decodedData = try JSONDecoder().decode([FetchModel].self, from: todoData)
                    
                    // Filter out any items where "name" is blank or null.
                    let filteredDecodedData = decodedData.filter{ $0.name != nil && $0.name != ""}
                    DispatchQueue.main.async {
                        
                        // Sort the resulting list by its "listId", so it can be displayed grouped by "listId"
                        self.fetchModels = filteredDecodedData.sorted(by: {$0.listId < $1.listId})
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
}
