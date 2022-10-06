//
//  EpisodesViewModel.swift
//  BBActors
//
//  Created by Hossein Hajimirza on 10/6/22.
//

import Foundation

final class EpisodesViewModel: ObservableObject {
    @Published public var episodesModel: [EpisodeModel]?
    
    private let networkManager: NetworkManager = .init()
    
    public func fetchData() {
        networkManager.handleRequestWithPath(.episodes) { (result: Result<[EpisodeModel], Error>) in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.episodesModel = model
                }
            case .failure(let error):
                print("EpisodesViewModel Fetching Error - \(error)")
            }
        }
    }
}
