//
//  NewsListDataModel.swift
//  Be-Daangn-iOS
//
//  Created by 김혜수 on 2021/05/18.
//



import Foundation

// MARK: - NewsListDataModel
struct NewsListDataModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [News]
}

// MARK: - News
struct News: Codable {
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
