//
//  TableViewProviderType.swift
//  SlidableTableView
//
//  Created by Yaroslav Abaturov on 25.07.2024.
//

import UIKit

protocol TableViewProviderType: AnyObject {
    var onConfigureCell: ((IndexPath) -> UITableViewCell)? { get set }
    var onSelectCell: ((IndexPath) -> Void)? { get set }
    var onSlidedCell: ((IndexPath) -> UISwipeActionsConfiguration?)? { get set }
    func registerCells(_ cells: [UITableViewCell.Type])
    func dequeueReusableCell<T>(for indexPath: IndexPath) -> T where T: UITableViewCell
    func scrollToRow(at index: IndexPath, at: UITableView.ScrollPosition, animated: Bool)
    func deleteRow(at index: IndexPath)
    func reloadData()
}
