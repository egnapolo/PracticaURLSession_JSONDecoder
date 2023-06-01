//
//  Model.swift
//  URLSessionJSONDecoder
//
//  Created by Egna Lizeth Polo Rubiano on 30/5/23.
//

import Foundation

struct PokemonDataModel: Decodable {
    let name: String
    let url: String
}
struct PokemonResponseDataModel: Decodable {
    let pokemons: [PokemonDataModel]
    
    enum CodingKeys: String, CodingKey{
        case results
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pokemons = try container.decode([PokemonDataModel].self, forKey: .results)
    }
}
