//
//  VirusClient.swift
//  VirusTracker
//
//  Created by Neil Hiddink on 4/28/20.
//  Copyright © 2020 Neil Hiddink. All rights reserved.
//

import Foundation

class VirusClient {

    static let shared = VirusClient()
    let baseURL = "https://api.covid19api.com/summary"
    
    func getSummaryResponse(_ completion: @escaping (SummaryResponse, Error?) -> Void) {
        
        let url = URL(string: baseURL)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            if let response = response as? HTTPURLResponse { print(response.statusCode) }
            
            let decoder = JSONDecoder()
            
            do {
                let summary = try decoder.decode(SummaryResponse.self, from: data)
                completion(summary, nil)
            } catch let error {
                print(error)
            }
            
        }
        
        task.resume()
    }
}
