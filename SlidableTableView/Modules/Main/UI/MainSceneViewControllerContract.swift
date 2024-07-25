//
//  MainSceneViewControllerContract.swift
//  SlidableTableView
//
//  Created by Yaroslav Abaturov on 25.07.2024.
//  Copyright (c) 2024 Yaroslav Abaturov. All rights reserved.
//

protocol MainSceneViewControllerType: AnyObject {
	func update(viewModelDataType: MainSceneViewControllerViewModel.ViewModelDataType)
}

struct MainSceneViewControllerViewModel {
	enum ViewModelDataType {
		case initialSetup(with: MainSceneViewModelType)
        case prepareForInitialAnimation
        case runInitialAnimation
	}
}
