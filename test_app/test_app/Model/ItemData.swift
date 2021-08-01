//
//  ItemData.swift
//  test_app
//
//  Created by Жадаев Алексей on 24.07.2021.
//

import Foundation

struct ItemData: Codable {
    let data: [Datum]
    let view: [String]
}

struct Datum: Codable {
    let name: String
    let data: DataClass
}

struct DataClass: Codable {
    let text: String?
    let url: String?
    let selectedID: Int?
    let variants: [Variant]?
}

struct Variant: Codable {
    let id: Int
    let text: String
}
