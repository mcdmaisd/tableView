//
//  SettingTableViewCell.swift
//  tableView
//
//  Created by ilim on 2024-06-04.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    @IBOutlet var optionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setLabel(_ data: IndexPath) {
        optionLabel.text = Options.allCases[data.section].cellTitle[data.row]
    }
    
}
