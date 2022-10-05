//
//  Home.swift
//  BBActors
//
//  Created by Hossein Hajimirza on 10/5/22.
//

import SwiftUI

struct Home: View {
    @StateObject private var viewModel: ViewModel = .init()
    @State private var searchText = ""
    @State private var navTitle = "Loading..."
    
    var filteredCharactersModel: [CharacterModel]? {
        if searchText.isEmpty {
            return viewModel.charactersModel
        } else {
            if let characterModel = viewModel.charactersModel {
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
                        viewModel.fetchData()
                    }
                }
                
                if let filteredCharactersModel {
                    ZStack {
                        if filteredCharactersModel.isEmpty {
                            Text("Empty!")
                        } else {
                            VStack {
                                ForEach(filteredCharactersModel) { characterModel in
                                    HomeRow(characterModel: characterModel)
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
            viewModel.fetchData()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
