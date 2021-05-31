//
//  Constants.swift
//  Be-Daangn-iOS
//
//  Created by taehy.k on 2021/05/15.
//

// MARK: - 공용 변수를 저장할 파일입니다.

import Foundation

struct Constants {
    
    // MARK: - BASE URL
    static let baseURL = "http://15.164.251.55:5000/api/main"
    
    // MARK: - Feature URL
    
    /// 1. 새소식 리스트 URL
    static let newsURL = baseURL + "/news"
    
    /// 2. 추천 리스트 URL
    static let recommendURL = baseURL + "/recommend"
    
    /// 3. 북마크 URL
    static let bookmarkURL = baseURL + "/recommend/bookmark"
    
}
