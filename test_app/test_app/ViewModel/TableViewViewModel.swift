//
//  TableViewViewModel.swift
//  test_app
//
//  Created by Жадаев Алексей on 23.07.2021.
//

import Foundation

class TableViewViewModel {
    
    private var selectedIndexPath: IndexPath?
    
    private var network = NetworkService()
    
    private var items: [Datum]?
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func numberOfRows() -> Int {
        return items?.count ?? 0
    }
    
    func configureItems(completion: @escaping () -> ()) {
        network.fetch { [weak self] items in
            self?.items = items
            completion()
        }
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModel? {
        guard let item = items?[indexPath.row] else { return nil}
        return TableViewCellViewModel(item: item)
    }
    
}
