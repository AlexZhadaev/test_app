//
//  TableViewCellViewModel.swift
//  test_app
//
//  Created by Жадаев Алексей on 23.07.2021.
//

import Foundation

class TableViewCellViewModel {
    
    private var item: Item
    
    var text: String {
        return item.text
    }
    
    var selector: [Variant] {
        return item.selector
    }
    
    var picture: String {
        return item.picture
    }
    
    var order: [String] {
        return item.order
    }
    
    init(item: Item) {
        self.item = item
    }
    
}
