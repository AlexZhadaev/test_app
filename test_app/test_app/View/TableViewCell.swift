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

    weak var viewModel: TableViewCellViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            cellText.text = viewModel.text
            cellVariantSelector.dataSource = viewModel.selector as? UIPickerViewDataSource
            cellPicture.image = UIImage(named: viewModel.picture)
        }
    }

}
