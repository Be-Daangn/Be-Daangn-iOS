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
    
    // 장소 추가
    var place: String = "장소 없음"
    
    // 후기랑 단골은 Int형으로 넘어올 것 같은데, 우선 더미 작업 위해서 String으로 선언
    var review: String
    var customer: String
    
    var bookmark: Bool = false
    
    // Tag는 우선 Int Array로 만들어놓자 (0~6까지)
    var tags: [Int]?
}

