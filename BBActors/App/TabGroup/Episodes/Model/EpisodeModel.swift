//
//  EpisodeModel.swift
//  BBActors
//
//  Created by Hossein Hajimirza on 10/6/22.
//

import Foundation

struct EpisodeModel: Codable, Identifiable {
    internal init() {
        self.episodeID = 0
        self.title = ""
        self.season = ""
        self.airDate = ""
        self.characters = []
        self.episode = ""
        self.series = ""
    }
    
    init(from decoder: Decoder) throws {
        let keyedCodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        if let episodeID = try? keyedCodingContainer.decode(Int.self, forKey: CodingKeys.episodeID) {
            self.episodeID = episodeID
        } else {
            self.episodeID = 0
        }
        
        if let title = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.title) {
            self.title = title
        } else {
            self.title = ""
        }
        
        if let season = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.season) {
            self.season = season
        } else {
            self.season = ""
        }
        
        if let airDate = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.airDate) {
            self.airDate = airDate
        } else {
            self.airDate = ""
        }
        
        if let characters = try? keyedCodingContainer.decode([String].self, forKey: CodingKeys.characters) {
            self.characters = characters
        } else {
            self.characters = []
        }
        
        if let episode = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.episode) {
            self.episode = episode
        } else {
            self.episode = ""
        }
        
        if let series = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.series) {
            self.series = series
        } else {
            self.series = ""
        }
    }
    
    let episodeID: Int
    let title, season, airDate: String
    let characters: [String]
    let episode: String
    let series: String
    let id = UUID()

    enum CodingKeys: String, CodingKey {
        case episodeID = "episode_id"
        case title, season
        case airDate = "air_date"
        case characters, episode, series
    }
}
