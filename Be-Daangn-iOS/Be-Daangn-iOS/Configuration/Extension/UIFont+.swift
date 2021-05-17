//
//  UIFont+.swift
//  Be-Daangn-iOS
//
//  Created by taehy.k on 2021/05/17.
//

/*
 
 폰트 사용 방법
- ex. label.font = .NotoSans(.bold, size: 16)
- ex. label.font = .NotoSans(.extraBold, size: 16)
 
 */

import UIKit

extension UIFont {
    public enum NotoSansType: String {
        case bold = "Bold"
        case extraBold = "ExtraBold"
    }

    static func NotoSans(_ type: NotoSansType, size: CGFloat) -> UIFont {
        return UIFont(name: "NotoSans-\(type.rawValue)", size: size)!
    }
}
