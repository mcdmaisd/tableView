//
//  TableViewController.swift
//  tableView
//
//  Created by ilim on 2024-05-24.
//

import UIKit

class OptionViewController: UIViewController {
    
    @IBOutlet var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        registerXib()
    }
    
    func configureTableView() {
        tableview.dataSource = self
        tableview.delegate = self
        tableview.rowHeight = 50
    }
    
    func registerXib()  {
        let xib = UINib(nibName: SettingTableViewCell.identifier, bundle: nil)
        tableview.register(xib, forCellReuseIdentifier: SettingTableViewCell.identifier)
    }
}

extension OptionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Options.allCases[section].cellTitle.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        Options.allCases[section].sectionTitle
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        Options.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
        cell.setLabel(indexPath)
        return cell
    }
}
