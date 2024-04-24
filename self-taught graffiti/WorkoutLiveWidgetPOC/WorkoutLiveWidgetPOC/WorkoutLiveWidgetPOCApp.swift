//
//  WorkoutLiveWidgetPOCApp.swift
//  WorkoutLiveWidgetPOC
//
//  Created by KyungHeon Lee on 2024/04/19.
//

import UIKit
import SwiftUI
import MediaPlayer

@main
struct WorkoutLiveWidgetPOCApp: App {
    var body: some Scene {
        WindowGroup {
            //TimerView()
            ContentView()
        }
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        UIApplication.shared.beginReceivingRemoteControlEvents()
    }

    func sceneWillResignActive(_ scene: UIScene) {
        UIApplication.shared.endReceivingRemoteControlEvents()
    }

    override func remoteControlReceived(with event: UIEvent?) {
        guard let event = event else { return }

        switch event.subtype {
        case .remoteControlTogglePlayPause:
            NotificationCenter.default.post(name: Notification.Name("ToggleTimer"), object: nil)
        default:
            break
        }
    }
}
