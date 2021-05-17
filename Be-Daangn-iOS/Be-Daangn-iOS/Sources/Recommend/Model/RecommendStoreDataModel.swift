//
//  RecommendStoreDataModel.swift
//  Be-Daangn-iOS
//
//  Created by taehy.k on 2021/05/17.
//

import Foundation

struct RecommendStoreDataModel {
    var imageName: String
    var name: String
    
    // 후기랑 단골은 Int형으로 넘어올 것 같은데, 우선 더미 작업 위해서 String으로 선언
    var review: String
    var customer: String
    
    // Tag는 우선 Int Array로 만들어놓자 (0~6까지)
    var tags: [Tag]?
}

struct Tag {
    var tagNumber: Int
}
