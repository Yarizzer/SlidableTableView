//
//  MainScenePresenterContract.swift
//  SlidableTableView
//
//  Created by Yaroslav Abaturov on 25.07.2024.
//  Copyright (c) 2024 Yaroslav Abaturov. All rights reserved.
//

protocol MainScenePresentable: AnyObject {
    func response(responseType: MainScenePresenterResponse.MainSceneResponseType)
}

struct MainScenePresenterResponse {
	enum MainSceneResponseType {
		case initialSetup
        case runInitialAnimation
        case prepareForInitialAnimation
	}
}
