//
//  NetworkResult.swift
//  Be-Daangn-iOS
//
//  Created by taehy.k on 2021/05/31.
//

import Foundation

// T의 의미는 어떤 타입이든 들어올 수 있다는 의미
enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
