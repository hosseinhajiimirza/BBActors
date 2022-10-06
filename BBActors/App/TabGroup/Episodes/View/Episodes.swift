//
//  Episodes.swift
//  BBActors
//
//  Created by Hossein Hajimirza on 10/6/22.
//

import SwiftUI

struct Episodes: View {
    @StateObject private var episodesViewModel: EpisodesViewModel = .init()
    @State private var navTitle = "Loading..."
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                PullToRefresh(coordinateSpaceName: "pullToRefresh") {
                    Task {
                        episodesViewModel.fetchData()
                    }
                }
                
                if let episodesModel = episodesViewModel.episodesModel {
                    ZStack {
                        if episodesModel.isEmpty {
                            Text("Empty!")
                        } else {
                            LazyVStack {
                                ForEach(episodesModel) { episodesModel in
                                   EpisodeRow(episodeModel: episodesModel)
                                }
                            }
                        }
                    }
                    .onAppear {
                        navTitle = "Quotes"
                    }
                }
            }
            .coordinateSpace(name: "pullToRefresh")
            .navigationTitle(navTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            episodesViewModel.fetchData()
        }
        
    }
}

struct Episodes_Previews: PreviewProvider {
    static var previews: some View {
        Episodes()
    }
}
