//
//  ApiClient.swift
//  DiscoverAirports
//
//  Created by Ricardo Developer on 13/05/24.
//

import Foundation

class APIClient {
    
    // Método para realizar una solicitud a la API y obtener datos de los aeropuertos disponibles.
    func fetchData (completion: @escaping (Result<[Airport], Error>) -> Void) {
        
        // Encabezados de la solicitud HTTP.
        let headers = [
            "X-RapidAPI-Key": "c2bcfa61f1mshf2abcf111b8af04p11138ejsnd5ae171d439b",
            "X-RapidAPI-Host": "radarflight.p.rapidapi.com"
        ]
        
        // Creación de la solicitud HTTP.
        var request = URLRequest(url: URL(string: "https://radarflight.p.rapidapi.com/api/v1/airport/BE/availables")!,timeoutInterval: Double.infinity)
        
        // Método HTTP utilizado en la solicitud.
        request.httpMethod = "GET"
        
        // Establecer los encabezados de la solicitud.
        request.allHTTPHeaderFields = headers
        
        // Crear y ejecutar una tarea de datos para realizar la solicitud HTTP.
        URLSession.shared.dataTask(with: request) { data, response, error in
            // Verificar si se recibieron datos en la respuesta.
            guard let data = data else {
                // Manejar errores de conexión o de recepción de datos.
                if let error = error {
                    print("Error: \(error)")
                } else {
                    // Manejar situaciones en las que no se reciben datos ni errores.
                }
                return
            }
            // Imprimir los datos recibidos como texto (útil para depuración).
            print(String(data: data, encoding: .utf8)!)
            
            // Intentar decodificar los datos JSON recibidos en un array de objetos Airport.
            do {
                let result = try JSONDecoder().decode([Airport].self, from: data)
                // Llamar al bloque de finalización con los datos decodificados.
                completion(.success(result))
            } catch {
                // Manejar errores de decodificación JSON.
                print("Error decoding JSON:\(error)")
                // Llamar al bloque de finalización con un error en caso de fallo en la decodificación.
                completion(.failure(error))
            }
        }.resume() // Reanudar la tarea de datos para iniciar la solicitud HTTP.
    }
}
