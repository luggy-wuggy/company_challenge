//
//  FetchModel.swift
//  fetch_challenge_ios
//
//  Created by Luqman Abdurrohman on 10/2/20.
//  Copyright © 2020 Luqman Abdurrohman. All rights reserved.
//

import Foundation

/// FetchModel is the data structure for the FetchJSON data. It contains an [id]. [listId] which are Int types and [name] which is a String type.
/// FetchModel takes in a Codable protocol in order for the JSON to be mapped to its properties and also the Identifiable protocol in order to display it onto a list.
struct FetchModel: Codable, Identifiable {
    public var id, listId: Int
    public var name: String?
}
