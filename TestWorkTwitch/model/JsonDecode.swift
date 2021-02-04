//
//  JsonDecode.swift
//  TestWorkTwitch
//
//  Created by Дмитрий Жучков on 01.02.2021.
//
import Foundation

// MARK: - JSONDecode
struct JSONData: Codable {
    let total: Int
    let top: [Top]

    enum CodingKeys: String, CodingKey {
        case total = "_total"
        case top
    }
}

// MARK: - Top
struct Top: Codable {
    let game: Game
    let viewers, channels: Int?
}

// MARK: - Game
struct Game: Codable {
    let name: String?
    let id, giantbombID: Int
    let box, logo: Box
    let localizedName: String
    let locale: Locale

    enum CodingKeys: String, CodingKey {
        case name
        case id = "_id"
        case giantbombID = "giantbomb_id"
        case box, logo
        case localizedName = "localized_name"
        case locale
    }
}

// MARK: - Box
struct Box: Codable {
    let large, medium, small: String
    let template: String
}

enum Locale: String, Codable {
    case enUs = "en-us"
}
