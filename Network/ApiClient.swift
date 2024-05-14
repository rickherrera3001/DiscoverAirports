//
//  ApiClient.swift
//  DiscoverAirports
//
//  Created by Ricardo Developer on 13/05/24.
//

import Foundation

class APIClient {
    
    func fetchData(completion: @escaping (Result<[Airport], Error>) -> Void) {
        
        let headers = [
            "X-RapidAPI-Key": "c2bcfa61f1mshf2abcf111b8af04p11138ejsnd5ae171d439b",
            "X-RapidAPI-Host": "airports-finder1.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://airports-finder1.p.rapidapi.com/airports/coordinates/32.9222/-97.0409")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                let unknownError = NSError(domain: "UnknownError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Error desconocido"])
                completion(.failure(unknownError))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                let statusCodeError = NSError(domain: "StatusCodeError", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: "Código de estado HTTP no exitoso: \(httpResponse.statusCode)"])
                completion(.failure(statusCodeError))
                return
            }
            
            guard let data = data else {
                let unknownError = NSError(domain: "UnknownError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Error desconocido"])
                completion(.failure(unknownError))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let airportsData = try decoder.decode([Airport].self, from: data)
                completion(.success(airportsData))
            } catch {
                completion(.failure(error))
            }
        }
        
        dataTask.resume()
    }
}
