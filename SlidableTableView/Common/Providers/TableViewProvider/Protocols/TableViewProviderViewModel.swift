//
//  TableViewProviderViewModel.swift
//  SlidableTableView
//
//  Created by Yaroslav Abaturov on 25.07.2024.
//

import UIKit

protocol TableViewProviderViewModel: AnyObject {
    var numberOfTableSections: Int { get }
    func numberOfTableRowsInSection(_ section: Int) -> Int
    func heightForRow(atIndex index: Int) -> Float
}
