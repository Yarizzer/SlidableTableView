//
//  MainSceneViewModel.swift
//  SlidableTableView
//
//  Created by Yaroslav Abaturov on 25.07.2024.
//  Copyright (c) 2024 Yaroslav Abaturov. All rights reserved.
//

final class MainSceneViewModel { }

extension MainSceneViewModel: MainSceneViewModelType {
    func invoke(action type: MainSceneViewModelActionType) {
        switch type {
        case .setupSubscription:
            #warning("Setup subscription here")
        }
    }
}
