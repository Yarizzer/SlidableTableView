//
//  MainSceneInteractorService.swift
//  SlidableTableView
//
//  Created by Yaroslav Abaturov on 25.07.2024.
//  Copyright (c) 2024 Yaroslav Abaturov. All rights reserved.
//

protocol MainSceneInteractorServiceType: AnyObject {
    func performViewModelCall(with action: MainSceneViewModelActionType)
}

final class MainSceneInteractorService {
	init(withModel model: MainSceneViewModelType) {
		self.viewModel = model
	}
	
	private let viewModel: MainSceneViewModelType
}

extension MainSceneInteractorService: MainSceneInteractorServiceType { 
    func performViewModelCall(with action: MainSceneViewModelActionType) { viewModel.invoke(action: action) }
}
