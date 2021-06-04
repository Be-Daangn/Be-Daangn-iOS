//
//  RecommendStoreDataModel.swift
//  Be-Daangn-iOS
//
//  Created by taehy.k on 2021/05/17.
//

/*
 {
     "status": 200,
     "success": true,
     "message": "북마크 가져오기성공",
     "data": [
         {
             "_id": "60a897a6705f0140353f7259",
             "title_idx": 1,
             "title": "다운타우너",
             "image": "https://carrotmarket.s3.ap-northeast-2.amazonaws.com/down.png",
             "review": 89,
             "customer": 31,
             "place": "한남동",
             "bookmark": true,
             "__v": 0
         }
     ]
 }
 */

import Foundation

struct RecommendDataModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [RecommendData]?
}

struct RecommendData: Codable {
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

