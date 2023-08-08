//
//  UpworkAnalyzerApp.swift
//  UpworkAnalyzer
//
//  Created by wang on 2023/8/7.
//

import SwiftUI
import BackgroundTasks

func scheduleAppRefresh() {
    let request = BGAppRefreshTaskRequest(identifier: "creative.UpworkAnalyzer.refresh")
    try? BGTaskScheduler.shared.submit(request)
}

@main
struct UpworkAnalyzerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) private var phase

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: phase) { newPhase in
            switch newPhase {
            case .background: scheduleAppRefresh()
            default: break
            }
        }
        .backgroundTask(.appRefresh("creative.UpworkAnalyzer.refresh")) {
            UpworkJobViewModel.shared.getData()
        }
    }
}
