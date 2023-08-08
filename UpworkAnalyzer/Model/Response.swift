//
//  UpworkJob.swift
//  UpworkAnalyzer
//
//  Created by wang on 2023/8/7.
//

import UIKit

struct Response: Codable {
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
    var badges = ""
    var createdAt = ""
    var country = ""
}
