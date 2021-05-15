//
//  SecretKey.swift
//  Be-Daangn-iOS
//
//  Created by taehy.k on 2021/05/15.
//

import UIKit

struct SecretKey {
    static let JWT_TOKEN = UserDefaults.standard.string(forKey: "jwt")
}
