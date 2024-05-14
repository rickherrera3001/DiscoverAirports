//
//  ApiClient.swift
//  DiscoverAirports
//
//  Created by Ricardo Developer on 13/05/24.
//

import Foundation
 
func fetchAirportData() {
    let headers = [
        "X-RapidAPI-Key": "SIGN-UP-FOR-KEY",
        "X-RapidAPI-Host": "airports-finder1.p.rapidapi.com"
    ]
    
    let request = NSMutableURLRequest(url: NSURL(string: "https://airports-finder1.p.rapidapi.com/airports/coordinates/32.9222/-97.0409")! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error as Any)
        } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
        }
    })
    
    dataTask.resume()
}
