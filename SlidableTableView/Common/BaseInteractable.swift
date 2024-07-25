//
//  BaseInteractable.swift
//  SlidableTableView
//
//  Created by Yaroslav Abaturov on 25.07.2024.
//

protocol BaseInteractable {
    func lifeCycleDidChanged(event type: BaseInteractableRequest.SceneLifeCycleEventType)
}

struct BaseInteractableRequest {
    enum SceneLifeCycleEventType {
        case sceneDidLoad
        case didEnterForeground
        case didEnterBackground
    }
}
