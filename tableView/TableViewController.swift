//
//  TableViewController.swift
//  tableView
//
//  Created by ilim on 2024-05-24.
//

import UIKit

class TableViewController: UITableViewController {

    let header = ["전체 설정", "개인 설정", "기타"]
    let cellTitle = [["공지사항", "실험실", "버전 정보"], ["개인/보안", "알림", "채팅", "멀티프로필"], ["고객센터/도움말"]]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return header[section]
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return header.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitle[section].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setCellText(indexPath: indexPath)
    }
    
    func setCellText(indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lim")!
        for i in 0 ..< cellTitle.count {
            for j in 0 ..< cellTitle[i].count {
                if indexPath.section == i && indexPath.row == j {
                    cell.textLabel?.text = cellTitle[i][j]
                    cell.textLabel?.font = .systemFont(ofSize: 15)
                }
            }
        }
        return cell
    }
}
