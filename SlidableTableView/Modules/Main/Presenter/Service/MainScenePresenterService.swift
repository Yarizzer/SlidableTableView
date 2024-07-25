//
//  MainScenePresenterService.swift
//  SlidableTableView
//
//  Created by Yaroslav Abaturov on 25.07.2024.
//  Copyright (c) 2024 Yaroslav Abaturov. All rights reserved.
//

protocol MainScenePresenterServiceType: AnyObject {
	var model: MainSceneViewModelType { get }
}

final class MainScenePresenterService {
	init(withModel model: MainSceneViewModelType) {
		self.viewModel = model
	}
	
	private let viewModel: MainSceneViewModelType
}

extension MainScenePresenterService: MainScenePresenterServiceType {
	var model: MainSceneViewModelType { return viewModel }
}
