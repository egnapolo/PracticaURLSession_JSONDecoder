//
//  ViewModel.swift
//  URLSessionJSONDecoder
//
//  Created by Egna Lizeth Polo Rubiano on 29/5/23.
//

import Foundation

final class ViewModel: ObservableObject {
    @Published var pokemons: [PokemonDataModel] = []
    func getPokemons(){
        guard let endPoind = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151") else {
            return
        }
        URLSession.shared.dataTask(with: endPoind) { data, response, error in
            if error != nil {
                print("Tengo un error")
            }
            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 {
                guard let pokemonDataModel = try? JSONDecoder().decode(PokemonResponseDataModel.self, from: data) else {
                    return
                }
               // print("Pokemons \(String(describing: pokemonDataModel))")
                DispatchQueue.main.async {
                    self.pokemons = pokemonDataModel.pokemons
                } 
            }
        }.resume()
    }
}
