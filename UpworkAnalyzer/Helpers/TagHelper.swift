//
//  TagHelper.swift
//  UpworkAnalyzer
//
//  Created by wang on 2023/8/7.
//

import UIKit

class TagHelper {
    static let screenWidth = UIScreen.main.bounds.width
    
    static func getTagSize(_ tagName: String) -> CGFloat {
        let font = UIFont.systemFont(ofSize: 12)
        let attributes = [NSAttributedString.Key.font: font]
        let size = (tagName as NSString).size(withAttributes: attributes)
        
        return size.width * 1.2
    }
    
    static func getTagMatrix(_ tags: [String]) -> [[String]] {
        var rows: [[String]] = []
        var currentRow: [String] = []
        
        var totalWidth: CGFloat = 0
        let screenWidth = screenWidth - 20
        let tagSpacing: CGFloat = 8
        
        guard !tags.isEmpty else {
            return []
        }

        for index in 0..<tags.count{
            let size = getTagSize(tags[index])
            totalWidth += (index == 0 ?  size : size + tagSpacing)
            
            if totalWidth > screenWidth {
                totalWidth = size
                rows.append(currentRow)
                currentRow.removeAll()
            }
            currentRow.append(tags[index])
        }
        
        if !currentRow.isEmpty {
            rows.append(currentRow)
            currentRow.removeAll()
        }
        
        return rows
    }
}
