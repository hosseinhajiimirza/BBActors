//
//  CharactersModel.swift
//  BBActors
//
//  Created by Hossein Hajimirza on 10/5/22.
//

import Foundation

// MARK: - CharacterModel
struct CharacterModel: Codable, Identifiable {
    internal init() {
        self.charID = 0
        self.name = ""
        self.birthday = ""
        self.occupation = [String]()
        self.img = ""
        self.status = .unknown
        self.nickname = ""
        self.appearance = [Int]()
        self.portrayed = ""
        self.category = ""
        self.betterCallSaulAppearance = [Int]()
    }
    
    init(from decoder: Decoder) throws {
        let keyedCodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        if let charID = try? keyedCodingContainer.decode(Int.self, forKey: CodingKeys.charID) {
            self.charID = charID
        } else {
            self.charID = 0
        }
        
        if let name = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.name) {
            self.name = name
        } else {
            self.name = "No name"
        }
        
        if let birthday = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.birthday) {
            self.birthday = birthday
        } else {
            self.birthday = "Unknown"
        }
        
        if let occupation = try? keyedCodingContainer.decode([String].self, forKey: CodingKeys.occupation) {
            self.occupation = occupation
        } else {
            self.occupation = [String]()
        }
        
        if let img = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.img) {
            self.img = img
        } else {
            self.img = "No ImageURL"
        }
        
        if let status = try? keyedCodingContainer.decode(Status.self, forKey: CodingKeys.status) {
            self.status = status
        } else {
            self.status = .unknown
        }
        
        if let nickname = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.nickname) {
            self.nickname = nickname
        } else {
            self.nickname = "No Nickname"
        }
        
        if let appearance = try? keyedCodingContainer.decode([Int].self, forKey: CodingKeys.appearance) {
            self.appearance = appearance
        } else {
            self.appearance = [Int]()
        }
        
        if let portrayed = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.portrayed) {
            self.portrayed = portrayed
        } else {
            self.portrayed = "No Portrayed"
        }
        
        if let category = try? keyedCodingContainer.decode(String.self, forKey: CodingKeys.category) {
            self.category = category
        } else {
            self.category = "No Category"
        }
        
        if let betterCallSaulAppearance = try? keyedCodingContainer.decode([Int].self, forKey: CodingKeys.betterCallSaulAppearance) {
            self.betterCallSaulAppearance = betterCallSaulAppearance
        } else {
            self.betterCallSaulAppearance = [Int]()
        }
    }
    
    let charID: Int
    let name: String
    let birthday: String
    let occupation: [String]
    let img: String
    let status: Status
    let nickname: String
    let appearance: [Int]
    let portrayed: String
    let category: String
    let betterCallSaulAppearance: [Int]
    let id = UUID()

    enum CodingKeys: String, CodingKey {
        case charID = "char_id"
        case name, birthday, occupation, img, status, nickname, appearance, portrayed, category
        case betterCallSaulAppearance = "better_call_saul_appearance"
    }
}

// MARK: - StatusEmum
enum Status: String, Codable {
    case alive = "Alive"
    case deceased = "Deceased"
    case presumedDead = "Presumed dead"
    case unknown = "Unknown"
}
