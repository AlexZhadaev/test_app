//
//  TableViewViewModel.swift
//  test_app
//
//  Created by Жадаев Алексей on 23.07.2021.
//

import Foundation

class TableViewViewModel {
    
    private var selectedIndexPath: IndexPath?
    
    var items: [Item] = []
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func numberOfRows() -> Int {
        return items.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModel? {
        let item = items[indexPath.row]
        return TableViewCellViewModel(item: item)
    }
    
}
