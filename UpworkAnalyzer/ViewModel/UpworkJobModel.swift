//
//  UpworkJobModel.swift
//  UpworkAnalyzer
//
//  Created by wang on 2023/8/7.
//

import UIKit

class UpworkJobModel: Identifiable {
    var id: Int
    var title = ""
    var time = ""
    var timestamp = ""
    var href = ""
    var jobType = ""
    var relativeTime = ""
    var hoursNeeded: String?
    var duration: String?
    var budget: String?
    var experienceLevel = ""
    var description = ""
    var badges = [String]()
    var createdAt = ""
    var country = ""
    
    var postedAt: String {
        let current = NSDate().timeIntervalSince1970
        let posted = Double(timestamp)! / 1000
        
        let diff = current - posted
        
        switch diff {
        case 0..<60:
            return "\(time) - \(Int(diff)) seconds ago"
        case 60..<3600:
            return "\(time) - \(Int(diff / 60)) minutes ago"
        case 3600 ..< 3600 * 24:
            return "\(time) - \(Int(diff / 3600)) hours ago"
        default:
            return "\(time) - \(Int(diff / 3600 / 24)) days ago"
        }
    }

    init(job: Response) {
        id = job.id
        title = job.title
        time = job.time
        timestamp = job.timestamp
        href = job.href
        jobType = job.jobType
        relativeTime = job.relativeTime
        hoursNeeded = job.hoursNeeded
        duration = job.duration
        budget = job.budget
        experienceLevel = job.experienceLevel
        description = job.description
        badges = job.badges.split(separator: ",").map { String($0) }
        createdAt = job.createdAt
        country = job.country
    }
}
