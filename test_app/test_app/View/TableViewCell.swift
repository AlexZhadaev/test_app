//
//  TableViewCell.swift
//  test_app
//
//  Created by Жадаев Алексей on 23.07.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellText: UITextView!
    @IBOutlet weak var cellVariantSelector: UIPickerView!
    @IBOutlet weak var cellPicture: UIImageView!
    
    var variants: [String]?
    
    weak var viewModel: TableViewCellViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            
            if viewModel.text != nil && viewModel.picture != nil {
                guard let url = URL(string: viewModel.picture ?? "") else { return }
                cellPicture.load(url: url)
                cellVariantSelector.isHidden = true
            }
            if viewModel.selector != nil && viewModel.text == nil && viewModel.picture == nil {
                cellVariantSelector.delegate = self
                cellVariantSelector.dataSource = self
                variants = viewModel.titlesForRow()
            }
            if viewModel.text != nil && viewModel.picture == nil {
                cellText.text = viewModel.text
                cellVariantSelector.isHidden = true
            }
            
        }
    }
    
}

extension TableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return variants?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return variants?[row]
    }
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
