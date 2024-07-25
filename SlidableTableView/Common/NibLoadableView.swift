//
//  NibLoadableView.swift
//  SlidableTableView
//
//  Created by Yaroslav Abaturov on 25.07.2024.
//

import UIKit

protocol NibLoadableView: AnyObject {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String { String(describing: self) }
}

extension NibLoadableView where Self: UIViewController {
    static var nibName: String { String(describing: self) }
}
