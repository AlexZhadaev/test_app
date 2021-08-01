//
//  NetworkService.swift
//  test_app
//
//  Created by Жадаев Алексей on 23.07.2021.
//

import Foundation

struct NetworkService {
    
    func fetch(completion: @escaping ([Datum]) -> Void) {
        let urlString = "https://pryaniky.com/static/json/sample.json"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let item = parseJSON(withData: data) {
                    let itemArray = convertItem(item: item)
                    completion(itemArray)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> Item? {
        let decoder = JSONDecoder()
        do {
            let itemData = try decoder.decode(ItemData.self, from: data)
            guard let item = Item(itemData: itemData) else { return nil }
            return item
            
        } catch let error as NSError {
            debugPrint(error.localizedDescription)
        }
        return nil
    }
    
    func convertItem(item: Item) -> [Datum] {
        var itemArray: [Datum] = []
        for i in item.order {
            if i == item.text.name {
                itemArray.append(item.text)
            } else if i == item.picture.name {
                itemArray.append(item.picture)
            } else if i == item.selector.name {
                itemArray.append(item.selector)
            }
        }
        return itemArray
    }
    
}
