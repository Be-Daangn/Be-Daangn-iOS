//
//  dummy.swift
//  Be-Daangn-iOS
//
//  Created by 박익범 on 2021/05/18.
//

import Foundation

struct newsDataModel {
    var Newsimage : String
    var name : String
    var subname : String
    var location : String
}
struct sectionDataModel {
    var name: String
}
struct smallSectionDataModel {
    var name : String
}
struct recommendDataModel{
    var recommendImage : String
    var name:String
    var location : String
    var subject : String
    var custom: String
    var review:String
}


// MARK: - Data
struct Datamodel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [HomeDataModel]
}

// MARK: - HomeDataModel
struct HomeDataModel: Codable {
    let id: String
    let titleIdx: Int
    let title: String
    let image: String
    let event, place, info: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case titleIdx = "title_idx"
        case title, image, event, place, info
        case v = "__v"
    }
}
