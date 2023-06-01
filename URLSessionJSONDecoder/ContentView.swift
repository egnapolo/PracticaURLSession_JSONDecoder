//
//  ContentView.swift
//  URLSessionJSONDecoder
//
//  Created by Egna Lizeth Polo Rubiano on 29/5/23.
//

import SwiftUI

struct ContentView: View {
  @StateObject var viewModel: ViewModel = ViewModel()
    var body: some View {
        NavigationView {
            Form {
                ForEach(viewModel.pokemons, id: \.name) { pokemon in
                    Text(pokemon.name)
                }.navigationTitle("Pokemons")
            }.onAppear {
                viewModel.getPokemons()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
