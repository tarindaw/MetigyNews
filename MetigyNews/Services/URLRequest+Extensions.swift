//
//  WebService.swift
//  MetigyNews
//
//  Created by Tarinda on 9/7/21.
//

import Foundation

struct Resource<T: Decodable> {
    let url: URL
}

extension URLRequest {
    static func load<T>(resource: Resource<T>, completion: @escaping (Any?) -> ()) {
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let decodedResponse = try? JSONDecoder().decode(T.self, from: data)
                if let data = decodedResponse {
                    completion(data)
                }
            }
        }.resume()
    }
}
