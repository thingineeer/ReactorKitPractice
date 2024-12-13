//
//  MyDataSource.swift
//  ReactorKitPractice
//
//  Created by 이명진 on 11/27/24.
//

import UIKit

final class MyDataSource: UITableViewDiffableDataSource<Int, MyItem> {
    
    // 편집모드 > 셀 이동 처리
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        <#code#>
//    }
//    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        <#code#>
//    }
}

extension MyDataSource {
    func update(items: [MyItem]) {
        var snapshot = snapshot()
        snapshot.deleteAllItems()
        snapshot.appendSections([0])
        snapshot.appendItems(items)
        apply(snapshot)
    }
}
