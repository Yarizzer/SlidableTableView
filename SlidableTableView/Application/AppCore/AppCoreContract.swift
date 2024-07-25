//
//  AppCoreContract.swift
//  SlidableTableView
//
//  Created by Yaroslav Abaturov on 25.07.2024.
//

import Foundation

enum AppCoreAction {
    //MARK: - Session
    case prepareLocalSession
    case prepareRemoteIfNeededSession
    case openLocalSession
    case openRemoteSessionIfNeeded
    case closeLocalSession
    case closeRemoteSessionIfNeeded
}

protocol AppCoreSessionable: AnyObject {
    //Initializing
    func initialize(sessionUID: UUID, completion: @escaping (Bool) -> ())
    //Invoker
    func invokeNodeAction(with type: AppCoreAction)
}

