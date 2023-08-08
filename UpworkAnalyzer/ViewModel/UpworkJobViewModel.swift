//
//  UpworkJobViewModel.swift
//  UpworkAnalyzer
//
//  Created by wang on 2023/8/7.
//

import UIKit

class UpworkJobViewModel: ObservableObject {
    static let shared = UpworkJobViewModel()
    
    init() {
        self.getData()
        Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { timer in
            self.getData()
        }
    }
    @Published var jobs = [UpworkJobModel]()
    
    func getData() {
        var requestUrl = "http://192.168.0.152:3000/"
        
        if jobs.count > 0 {
            requestUrl += "?createdAt=\(jobs.first!.createdAt)"
        }
        
        guard let url = URL(string: requestUrl) else {
            return
        }
        
        NetworkHelper.loadData(url: url) { jobs in
            if let jobs = jobs, jobs.count > 0 {
                if self.jobs.count > 0 {
                    NotificationHelper.shared.requestAuthorization { granted in
                        if granted {
                            NotificationHelper.shared.scheduleNotification(newJobCount: jobs.count)
                        }
                    }
                }
                
                var buff = jobs.map(UpworkJobModel.init)
                buff.reverse()
                
                for job in buff {
                    if !self.jobs.contains(where: { $0.id == job.id }) {
                        self.jobs.insert(job, at: 0)
                    }
                }

                if self.jobs.count > 40 {
                    self.jobs = Array(self.jobs[0..<40])
                }
            }
        }
    }
}
