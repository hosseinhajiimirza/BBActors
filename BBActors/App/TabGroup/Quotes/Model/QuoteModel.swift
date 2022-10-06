//
//  QuoteModel.swift
//  BBActors
//
//  Created by Hossein Hajimirza on 10/6/22.
//

import Foundation

// MARK: - QuoteModel
struct QuoteModel: Codable, Identifiable {
    internal init() {
        self.quoteID = 0
        self.quote = ""
        self.author = ""
        self.series = ""
    }
    
    init(from decoder: Decoder) throws {
        let keyedCodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        if let quoteID = try? keyedCodingContainer.decode(Int.self, forKey: CodingKeys.quoteID) {
            self.quoteID = quoteID
        } else {
            self.quoteID = 0
        }
        
        if let quote = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.quote) {
            self.quote = quote
        } else {
            self.quote = ""
        }
        
        if let author = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.author) {
            self.author = author
        } else {
            self.author = ""
        }
        
        if let series = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.series) {
            self.series = series
        } else {
            self.series = ""
        }
    }
    
    let quoteID: Int
    let quote, author: String
    let series: String
    let id = UUID()

    enum CodingKeys: String, CodingKey {
        case quoteID = "quote_id"
        case quote, author, series
    }
}
