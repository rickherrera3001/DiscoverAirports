//
//  HomeViewModel.swift
//  DiscoverAirports
//
//  Created by Ricardo Developer on 13/05/24.
//

import Foundation

// MARK: - AirportViewModel

class HomeAirportViewModel {
    static let shared = HomeAirportViewModel() // Crea una instancia compartida de AirportViewModel
    
    private init() {} // Declara un inicializador privado para prevenir instanciación externa
    
    // Estado para almacenar el aeropuerto seleccionado
    @Published var selectedAirport: Airport?
    
    // Método para seleccionar un aeropuerto
        func selectAirport(_ airport: Airport) {
            selectedAirport = airport
        }
    }
    
    func fetchAirports(forCountry country: String, completion: @escaping (Result<Airports, Error>) -> Void) {
        let headers = [ // Crea un diccionario de encabezados para la solicitud
            "X-RapidAPI-Key": "c2bcfa61f1mshf2abcf111b8af04p11138ejsnd5ae171d439b",
            "X-RapidAPI-Host": "radarflight.p.rapidapi.com"
        ]
        
        guard let url = URL(string: "https://radarflight.p.rapidapi.com/api/v1/airport/\(country)/availables") else { // Crea una URL utilizando el país proporcionado
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil))) // Si la URL no es válida, llama al bloque de finalización con un error
            return
        }
        
        var request = URLRequest(url: url) // Crea una solicitud URLRequest con la URL
        request.httpMethod = "GET" // Establece el método HTTP como GET
        request.allHTTPHeaderFields = headers // Agrega los encabezados a la solicitud
        
        let session = URLSession.shared // Obtiene la sesión compartida de URLSession
        let dataTask = session.dataTask(with: request) { (data, response, error) in // Crea una tarea de datos con la solicitud
            if let error = error { // Si hay un error durante la solicitud
                completion(.failure(error)) // Llama al bloque de finalización con el error
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else { // Verifica si la respuesta HTTP es exitosa
                completion(.failure(NSError(domain: "Invalid response", code: 0, userInfo: nil))) // Si la respuesta no es válida, llama al bloque de finalización con un error
                return
            }
            
            guard let data = data else { // Verifica si se recibieron datos
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil))) // Si no se recibieron datos, llama al bloque de finalización con un error
                return
            }
            
            do { // Intenta decodificar los datos recibidos en el tipo Airports
                let airports = try JSONDecoder().decode(Airports.self, from: data)
                completion(.success(airports)) // Si tiene éxito, llama al bloque de finalización con el resultado exitoso
            } catch {
                completion(.failure(error)) // Si hay un error durante la decodificación, llama al bloque de finalización con el error
            }
        }
        
        dataTask.resume() // Inicia la tarea de datos
    }

