//
//  TableViewCellViewModel.swift
//  test_app
//
//  Created by Жадаев Алексей on 23.07.2021.
//

import Foundation

class TableViewCellViewModel {
    
    private var item: Datum
    
    private var variants = [String]()
    
    var text: String? {
        return item.data.text
    }
    
    var selector: [Variant]? {
        return item.data.variants
    }
    
    var picture: String? {
        return item.data.url
    }
    
    init(item: Datum) {
        self.item = item
        self.variants.append(item.data.variants?[0].text ?? "")
        self.variants.append(item.data.variants?[1].text ?? "")
        self.variants.append(item.data.variants?[2].text ?? "")
    }
    
    func titlesForRow() -> [String] {
        return variants
    }
    
}
