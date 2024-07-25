//
//  BaseViewController.swift
//  SlidableTableView
//
//  Created by Yaroslav Abaturov on 25.07.2024.
//

import UIKit

class BaseViewController<InteractorT>: UIViewController {
    override func viewDidLoad() { super.viewDidLoad() }
    
    var interactor: InteractorT?
}
