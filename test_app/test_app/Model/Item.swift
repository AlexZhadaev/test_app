//
//  Item.swift
//  test_app
//
//  Created by Жадаев Алексей on 23.07.2021.
//

import Foundation

struct Item {
    var text: Datum
    var selector: Datum
    var picture: Datum
    var order: [String]
    
    init?(itemData: ItemData) {
        text = itemData.data[0]
        picture = itemData.data[1]
        selector = itemData.data[2]
        order = itemData.view
    }
}

struct ItemVariant {
    var id: Int
    var text: String
    
    init?(itemData: Variant) {
        id = itemData.id
        text = itemData.text
    }
}

