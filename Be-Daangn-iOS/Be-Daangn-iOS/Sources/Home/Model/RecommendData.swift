//
//  RecommendData.swift
//  Be-Daangn-iOS
//
//  Created by 박익범 on 2021/06/07.
//

import Foundation


// MARK: - Data
struct Recommendmodel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [HomeRecommendDataModel]
}

// MARK: - Datum
struct HomeRecommendDataModel: Codable {
    let id: String
    let titleIdx: Int
    let title: String
    let image: String
    let review, customer: Int
    let place: String
    let bookmark: Bool
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case titleIdx = "title_idx"
        case title, image, review, customer, place, bookmark
        case v = "__v"
    }
}
