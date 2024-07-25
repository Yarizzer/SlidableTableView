//
//  MainSceneInteractor.swift
//  SlidableTableView
//
//  Created by Yaroslav Abaturov on 25.07.2024.
//  Copyright (c) 2024 Yaroslav Abaturov. All rights reserved.
//

final class MainSceneInteractor {
	init(withRouter router: MainSceneRoutable, presenter: MainScenePresentable, service: MainSceneInteractorServiceType) {
		self.router = router
		self.presenter = presenter
		self.service = service
	}

	private let router: MainSceneRoutable
	private let presenter: MainScenePresentable
	private let service: MainSceneInteractorServiceType
}

extension MainSceneInteractor: MainSceneInteractable {
	func makeRequest(requestType: MainSceneInteractorRequest.RequestType) {
		switch requestType {
		case .testRequest:
            #warning("test request placeholder to replace")
		}
	}
}

extension MainSceneInteractor: BaseInteractable {
    func lifeCycleDidChanged(event type: BaseInteractableRequest.SceneLifeCycleEventType) {
        switch type {
        case .sceneDidLoad:
            /*
            - First invoke Presenter Subscription if needed
            - presenter initial setup
            - presenter preparation for initial animation if needed
            - Last setup VM subscription
            */
            presenter.response(responseType: .initialSetup)
            presenter.response(responseType: .prepareForInitialAnimation)
            
            service.performViewModelCall(with: .setupSubscription)
        case .didEnterForeground:   presenter.response(responseType: .runInitialAnimation)
        case .didEnterBackground:   presenter.response(responseType: .prepareForInitialAnimation)
        }
    }
}
