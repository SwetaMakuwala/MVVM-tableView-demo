//
//  MemeResponse.swift
//  MakeUpApp
//
//  Created by sweta makuwala on 10/10/22.
//

import Foundation

// MARK: - MemeResponse
struct MemeResponse: Decodable {
    let success: Bool
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Decodable {
    let memes: [Meme]
}

// MARK: - Meme
struct Meme: Decodable {
    let name: String
    let url: String
}
