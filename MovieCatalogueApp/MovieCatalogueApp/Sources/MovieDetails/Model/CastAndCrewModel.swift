//
//  CastAndCrewModel.swift
//  MovieCatalogueApp
//
//  Created by NEOSOFT1 on 15/04/23.
//

import Foundation

// MARK: - CastAndCrewModel
struct CastAndCrewModel : Codable {
    let id : Int?
    let cast : [Cast]?
    let crew : [Crew]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case cast = "cast"
        case crew = "crew"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        cast = try values.decodeIfPresent([Cast].self, forKey: .cast)
        crew = try values.decodeIfPresent([Crew].self, forKey: .crew)
    }

}
 
struct Cast : Codable {
    let adult : Bool?
    let gender : Int?
    let id : Int?
    let known_for_department : String?
    let name : String?
    let original_name : String?
    let popularity : Double?
    let profile_path : String?
    let cast_id : Int?
    let character : String?
    let credit_id : String?
    let order : Int?

    enum CodingKeys: String, CodingKey {

        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case known_for_department = "known_for_department"
        case name = "name"
        case original_name = "original_name"
        case popularity = "popularity"
        case profile_path = "profile_path"
        case cast_id = "cast_id"
        case character = "character"
        case credit_id = "credit_id"
        case order = "order"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        gender = try values.decodeIfPresent(Int.self, forKey: .gender)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        known_for_department = try values.decodeIfPresent(String.self, forKey: .known_for_department)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        original_name = try values.decodeIfPresent(String.self, forKey: .original_name)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        profile_path = try values.decodeIfPresent(String.self, forKey: .profile_path)
        cast_id = try values.decodeIfPresent(Int.self, forKey: .cast_id)
        character = try values.decodeIfPresent(String.self, forKey: .character)
        credit_id = try values.decodeIfPresent(String.self, forKey: .credit_id)
        order = try values.decodeIfPresent(Int.self, forKey: .order)
    }

}


struct Crew : Codable {
    let adult : Bool?
    let gender : Int?
    let id : Int?
    let known_for_department : String?
    let name : String?
    let original_name : String?
    let popularity : Double?
    let profile_path : String?
    let credit_id : String?
    let department : String?
    let job : String?

    enum CodingKeys: String, CodingKey {

        case adult = "adult"
        case gender = "gender"
        case id = "id"
        case known_for_department = "known_for_department"
        case name = "name"
        case original_name = "original_name"
        case popularity = "popularity"
        case profile_path = "profile_path"
        case credit_id = "credit_id"
        case department = "department"
        case job = "job"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        gender = try values.decodeIfPresent(Int.self, forKey: .gender)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        known_for_department = try values.decodeIfPresent(String.self, forKey: .known_for_department)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        original_name = try values.decodeIfPresent(String.self, forKey: .original_name)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        profile_path = try values.decodeIfPresent(String.self, forKey: .profile_path)
        credit_id = try values.decodeIfPresent(String.self, forKey: .credit_id)
        department = try values.decodeIfPresent(String.self, forKey: .department)
        job = try values.decodeIfPresent(String.self, forKey: .job)
    }

}
