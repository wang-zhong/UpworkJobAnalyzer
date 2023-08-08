//
//  TagView.swift
//  UpworkAnalyzer
//
//  Created by wang on 2023/8/7.
//

import SwiftUI

struct TagView: View {
    var tags: [String]
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(TagHelper.getTagMatrix(tags), id: \.self) { rows in
                HStack(spacing: 4) {
                    ForEach(rows, id: \.self) { row in
                        Text(row)
                            .font(.system(size: 12))
                            .padding(.leading, 8)
                            .padding(.trailing, 8)
                            .padding(.vertical, 4)
                            .background(Capsule().fill(.gray.opacity(0.3)))
                    }
                }
            }
        }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(tags: ["React", "Redux", "Express.js", "Wordpress", "Virtual Assistance"])
    }
}
