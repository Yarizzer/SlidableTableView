//
//  AppCore.swift
//  SlidableTableView
//
//  Created by Yaroslav Abaturov on 25.07.2024.
//

import Foundation

final class AppCore {
    static let shared = AppCore()
    
    private init() { }
    
    private var uid: UUID?
}

extension AppCore: AppCoreSessionable {
    func initialize(sessionUID: UUID, completion: @escaping (Bool) -> ()) {
        self.uid = sessionUID
        
        (AppRuntimeNode.shared as AppSessionInjectedType).inject(with: sessionUID)
        (AppLanguageNode.shared as AppSessionInjectedType).inject(with: sessionUID)
        (AppNotificationsNode.shared as AppSessionInjectedType).inject(with: sessionUID)
        (AppRemoteDatabaseNode.shared as AppSessionInjectedType).inject(with: sessionUID)
        (AppLocalDatabaseNode.shared as AppSessionInjectedType).inject(with: sessionUID)
        (AppValidatorNode.shared as AppSessionInjectedType).inject(with: sessionUID)
        (AppUINode.shared as AppSessionInjectedType).inject(with: sessionUID)
        
        completion(true)
    }

    func invokeNodeAction(with type: AppCoreAction) {
        switch type {
        //MARK: - Session//MARK: - Session
        case .prepareLocalSession:
            AppRuntimeNode.shared.invoke(sessionUID: uid, type: .prepareSession)
            AppLanguageNode.shared.invoke(sessionUID: uid, type: .prepareSession)
            AppNotificationsNode.shared.invoke(sessionUID: uid, type: .prepareSession)
            AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .prepareSession)
            AppValidatorNode.shared.invoke(sessionUID: uid, type: .prepareSession)
            AppUINode.shared.invoke(sessionUID: uid, type: .prepareSession)
        case .prepareRemoteIfNeededSession:
            guard AppLocalDatabaseNode.shared.needToWakeUp else { return }
            
            AppRemoteDatabaseNode.shared.invoke(sessionUID: uid, type: .prepareSession)
        case .openLocalSession:
            AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .openSession)
        case .openRemoteSessionIfNeeded:
            guard AppLocalDatabaseNode.shared.needToWakeUp else { return }
                        
            AppRuntimeNode.shared.invoke(sessionUID: uid, type: .openSession)
            AppRemoteDatabaseNode.shared.invoke(sessionUID: uid, type: .openSession)
        case .closeLocalSession:
            AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .closeLocalSession)
        case .closeRemoteSessionIfNeeded:
            guard AppLocalDatabaseNode.shared.needToWakeUp else { return }
            
            AppRuntimeNode.shared.invoke(sessionUID: uid, type: .closeSession)
            AppRemoteDatabaseNode.shared.invoke(sessionUID: uid, type: .closeSession)
        //RuntimeNode
        case .closeApp:                                     AppRuntimeNode.shared.invoke(sessionUID: uid, type: .closeApp)
        //UINode
        case .uinGenerateFeedback(let feedbackType):        AppUINode.shared.invoke(sessionUID: uid, type: .uinGenerateFeedback(with: feedbackType))
        case .uinPlaySound(let feedbackType):               AppUINode.shared.invoke(sessionUID: uid, type: .uinPlaySound(with: feedbackType))
        case .uinVibrate:                                   AppUINode.shared.invoke(sessionUID: uid, type: .uinVibrate)
        //MARK: - RemoteDatabaseNode handling
        //handling
        case .updateLocalActions:                           AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .updateActionsData(with: AppRemoteDatabaseNode.shared.remoteActions))
        case .updateStatisticsPeriods:                      AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .updateStatisticsPeriodData(with: AppRemoteDatabaseNode.shared.statisticsPeriods))
        case .uploadAppSettingsData:                        AppRemoteDatabaseNode.shared.invoke(sessionUID: uid, type: .updateAppSettingsData)
        case .downloadImageData(let data):                  AppRemoteDatabaseNode.shared.invoke(sessionUID: uid, type: .getImage(with: data))
        //MARK: - LocalDatabaseNode
        //UserDefaults
        case .updateLanguageCode(let code):                 AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .updateCurrentLanguage(with: code))
        //Actions
        case .createAction(let data):                       AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .createAction(with: data))
        case .updateAction(let data):                       AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .updateAction(with: data))
        case .deleteAction(let data):                       AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .deleteAction(with: data))
        case .switchIsSelectedAction(let data):             AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .switchIsSelectedAction(with: data))
        //AppSettings
        case .updateSleepTime:                              AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .updateSleepTime)
        case .completeInitialSetup:                         AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .completeInitialSetup)
        //ImageData
        case .createImageData(let data):                    AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .createImageData(with: data))
        case .updateImageDataForModel(let data):            AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .updateImageDataForModel(model: data))
        case .updateImageDataForPointers:                   AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .updateImageDataForPointers(with: AppRemoteDatabaseNode.shared.remoteImageDataPointers))
        case .requestImageData(let data):                   AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .requestImageData(with: data))
        //Service
        case .createServiceItem(let data):                  AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .createServiceItem(with: data))
        case .deleteServiceItem(let data):                  AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .deleteServiceItem(with: data))
        //StatisticsPeriod
        case .selectStatisticsPeriodData(let data):         AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .selectStatisticsPeriod(with: data))
        //UserNotification
        case .createUserNotification(let data):             AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .createUserNotification(with: data))
        case .updateUserNotification(let data):             AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .updateUserNotification(with: data))
        case .deleteUserNotification(let data):             AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .deleteUserNotification(with: data))
        //UserSettings
        case .switchHideActionConfirmationValue:            AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .switchHideActionConfirmationValue)
        case .switchAutoeraseIsEnabledValue:                AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .switchAutoeraseIsEnabledValue)
        case .updateDataIsValidDaysCount(let value):        AppLocalDatabaseNode.shared.invoke(sessionUID: uid, type: .updateDataIsValidDaysCount(with: value))
        //MARK: - NotificationsNode
        //handling
        case .requestAuthorization:                         AppNotificationsNode.shared.invoke(sessionUID: uid, type: .requestAuthorization)
        case .registerNotification(let data):               AppNotificationsNode.shared.invoke(sessionUID: uid, type: .registerNotification(with: data))
        case .removeNotification(let identifier):           AppNotificationsNode.shared.invoke(sessionUID: uid, type: .removePermanentNotification(with: identifier))
        //MARK: - Validation
        case .validate(let data):                           AppValidatorNode.shared.invoke(sessionUID: uid, type: .validate(with: data))
        }
    }
}
