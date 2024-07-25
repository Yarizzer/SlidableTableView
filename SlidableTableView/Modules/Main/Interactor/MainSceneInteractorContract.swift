//
//  MainSceneInteractorContract.swift
//  SlidableTableView
//
//  Created by Yaroslav Abaturov on 25.07.2024.
//  Copyright (c) 2024 Yaroslav Abaturov. All rights reserved.
//

protocol MainSceneInteractable: AnyObject {
	func makeRequest(requestType: MainSceneInteractorRequest.RequestType)
}

struct MainSceneInteractorRequest {
	enum RequestType {
		case testRequest
	}
}
