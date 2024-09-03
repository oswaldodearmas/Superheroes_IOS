//
//  HeroAPIProvider.swift
//  Superheroes_IOS
//
//  Created by Mañanas on 3/9/24.
//

import Foundation

class HeroAPIProvider {
    
    // MARK: API Network calls
    
    static func searchByName(heroName: String, completionHandler: @escaping ([Hero]) -> Void) {
        
        let url = URL(string:"https://superheroapi.com/api/7252591128153666/search/\(heroName)")
            
            let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                if let error = error {
                    print("Error fetching superheroes: \(error)")
                    return
                }
                
                /*if let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) {
                    print("Error with the response, unexpected status code: \(httpResponse.statusCode)")
                    return
                }*/
                
                guard let data = data else {
                    print("Error with the data")
                    return
                }
                
                print("Data: \(data)")
                
                guard let json = try? JSONDecoder().decode(HeroResponse.self, from: data) else {
                    print("JSON parse exception")
                    return
                }
                
                completionHandler(json.results)
                
            })
            
            task.resume()
        }
        
        static func findById() {
            
        }
    
    // MARK: Utils
    
    struct RuntimeError: Error {
        let description: String
        
        init(_ description: String) {
            self.description = description
        }
    }
    
}
