//
//  NotificationHelper.swift
//  UpworkAnalyzer
//
//  Created by wang on 2023/8/8.
//

import UIKit

class NotificationHelper {
    var settings: NSObject? = nil
    
    static var shared = NotificationHelper()
    
    func requestAuthorization(completion: @escaping  (Bool) -> Void) {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) { granted, _  in
                self.fetchNotificationSettings()
                completion(granted)
            }
    }
    
    func fetchNotificationSettings() {
      UNUserNotificationCenter.current().getNotificationSettings { settings in
        DispatchQueue.main.async {
          self.settings = settings
        }
      }
    }
    
    func scheduleNotification(newJobCount: Int) {
        let content = UNMutableNotificationContent()
        content.title = "Hurry up!"
        content.body = "\(newJobCount) new jobs are posted."
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: 5,
            repeats: false)

        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print(error)
            }
        }
    }
    
    func removeScheduledNotification(taskId: String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [taskId])
    }
}
