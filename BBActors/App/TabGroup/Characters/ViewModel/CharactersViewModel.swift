//
//  CharactersViewModel.swift
//  BBActors
//
//  Created by Hossein Hajimirza on 10/5/22.
//

import SwiftUI

final class CharactersViewModel: ObservableObject {
    @Published public var charactersModel: [CharacterModel]?
    
    private let networkManager: NetworkManager = .init()
    
    public func fetchData() {
        networkManager.handleRequestWithPath(.characters) { (result: Result<[CharacterModel], Error>) in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.charactersModel = model
                }
            case .failure(let error):
                print("HomeViewModel Fetching Error - \(error)")
            }
        }
    }
}
