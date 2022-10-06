//
//  Characters.swift
//  BBActors
//
//  Created by Hossein Hajimirza on 10/5/22.
//

import SwiftUI

struct Characters: View {
    @StateObject private var charactersViewModel: CharactersViewModel = .init()
    @State private var searchText = ""
    @State private var navTitle = "Loading..."
    
    var filteredCharactersModel: [CharacterModel]? {
        if searchText.isEmpty {
            return charactersViewModel.charactersModel
        } else {
            if let characterModel = charactersViewModel.charactersModel {
                return characterModel.filter({$0.name.localizedCaseInsensitiveContains(searchText)})
            }
            
            return nil
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                PullToRefresh(coordinateSpaceName: "pullToRefresh") {
                    Task {
                        charactersViewModel.fetchData()
                    }
                }
                
                if let filteredCharactersModel {
                    ZStack {
                        if filteredCharactersModel.isEmpty {
                            Text("Empty!")
                        } else {
                            VStack {
                                ForEach(filteredCharactersModel) { characterModel in
                                    NavigationLink(destination: DetailView(characterModel: characterModel)) {
                                        CharactersRow(characterModel: characterModel)
                                    }
                                }
                            }
                        }
                    }
                    .onAppear {
                        navTitle = "Breaking Bad"
                    }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search")
            .coordinateSpace(name: "pullToRefresh")
            .navigationTitle(navTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            charactersViewModel.fetchData()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Characters()
    }
}
