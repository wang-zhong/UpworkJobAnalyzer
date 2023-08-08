//
//  NetworkManager.swift
//  UpworkAnalyzer
//
//  Created by wang on 2023/8/7.
//

import UIKit

class NetworkHelper {
    static func loadData(url: URL, completion: @escaping ([Response]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            if let response = try? JSONDecoder().decode([Response].self, from: data) {
                DispatchQueue.main.async {
                    completion(response)
                }
            }
        }.resume()
    }
}
