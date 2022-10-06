//
//  QuotesViewModel.swift
//  BBActors
//
//  Created by Hossein Hajimirza on 10/6/22.
//

import Foundation

final class QuotesViewModel: ObservableObject {
    @Published public var quotesModel: [QuoteModel]?
    
    private let networkManager: NetworkManager = .init()
    
    public func fetchData() {
        networkManager.handleRequestWithPath(.quotes) { (result: Result<[QuoteModel], Error>) in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.quotesModel = model
                }
            case .failure(let error):
                print("QuoteViewModel Fetching Error - \(error)")
            }
        }
    }
}
