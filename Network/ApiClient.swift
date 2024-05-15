//
//  ApiClient.swift
//  DiscoverAirports
//
//  Created by Ricardo Developer on 13/05/24.
//

import Foundation

// Clase para realizar solicitudes a la API y obtener datos de los aeropuertos disponibles.
class APIClient {
    // Método para obtener datos de la API.
    func fetchData(completion: @escaping (Result<[Airport], Error>) -> Void ) {
        // Encabezados de la solicitud.
        let headers = [
            "X-RapidAPI-Key": "c2bcfa61f1mshf2abcf111b8af04p11138ejsnd5ae171d439b",
            "X-RapidAPI-Host": "radarflight.p.rapidapi.com"
        ]
        
        // Creación de la solicitud.
        let request = NSMutableURLRequest(url: NSURL(string: "https://radarflight.p.rapidapi.com/api/v1/airport/BE/availables")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET" // Método HTTP: GET
        request.allHTTPHeaderFields = headers // Establecer los encabezados de la solicitud
        
        // Sesión de URL para realizar la solicitud.
        let session = URLSession.shared
        // Tarea de datos para realizar la solicitud y manejar la respuesta.
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                // Manejo de errores si la solicitud falla.
                print("Error: \(error)")
            } else if let httpResponse = response as? HTTPURLResponse {
                // Manejo de la respuesta HTTP.
                print("Response: \(httpResponse)")
                
                if let data = data {
                    // Aquí puedes manejar los datos recibidos, por ejemplo, decodificarlos si son JSON.
                }
            }
        })
        
        // Iniciar la tarea de datos.
        dataTask.resume()
    }
}


