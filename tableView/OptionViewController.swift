//
//  TableViewController.swift
//  tableView
//
//  Created by ilim on 2024-05-24.
//

import UIKit

import SnapKit

struct Options: Hashable, Identifiable {
    let id = UUID()
    let title: String
}

enum Section: String, CaseIterable {
    case entire = "전체 설정"
    case personal = "개인 설정"
    case etc = "기타"
}

class OptionViewController: UIViewController {
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    private var dataSource: UICollectionViewDiffableDataSource<Section, Options>!

    let entire = [
        Options(title: "공지사항"),
        Options(title: "실험실"),
        Options(title: "버전 정보")
    ]
    
    let personal = [
        Options(title: "개인/보안"),
        Options(title: "알림"),
        Options(title: "채팅"),
        Options(title: "멀티프로필")
    ]
    
    let etc = [
        Options(title: "고객센터/도움말")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "설정"
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        configureDataSource()
        updateSnapshot()
    }
    
    
    func configureDataSource() {
        var registration: UICollectionView.CellRegistration<UICollectionViewCell, Options>!
        registration = UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.title
                        
            var backgroundConfig = UIBackgroundConfiguration.listGroupedCell()
            backgroundConfig.backgroundColor = .white
            
            cell.contentConfiguration = content
            cell.backgroundConfiguration = backgroundConfig
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
    
    func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Options>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(entire, toSection: .entire)
        snapshot.appendItems(personal, toSection: .personal)
        snapshot.appendItems(etc, toSection: .etc)
        dataSource.apply(snapshot)
    }

    
    func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        
        configuration.backgroundColor = .clear
        configuration.showsSeparators = false
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        return layout
    }
}

