//
//  ContentView.swift
//  UpworkAnalyzer
//
//  Created by wang on 2023/8/7.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = UpworkJobViewModel.shared
    
    var body: some View {
        List(model.jobs) { job in
            Section {
                VStack(alignment: .leading) {
                    Text(job.title).font(.title)
                    Text(job.postedAt).font(.subheadline).padding(.bottom, 4)
                    if job.jobType.starts(with: "Hourly") {
                        Text(job.jobType)
                        HStack {
                            Text(job.hoursNeeded!)
                            Text(job.duration!)
                        }
                    } else {
                        HStack {
                            Text(job.jobType)
                            Text(job.budget!)
                        }
                    }
                    Text(job.country).foregroundColor(.blue)
                    Text(job.description).padding(.top, 4)
                    TagView(tags: job.badges)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
