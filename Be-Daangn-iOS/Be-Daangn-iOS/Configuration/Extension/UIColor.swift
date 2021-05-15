//
//  UIColor.swift
//  Be-Daangn-iOS
//
//  Created by taehy.k on 2021/05/15.
//

import UIKit

extension UIColor {
    // MARK: hex code를 이용하여 정의
    // ex. UIColor(hex: 0xF5663F)
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    // MARK: 메인 테마 색 또는 자주 쓰는 색을 정의
    // ex. label.textColor = .mainOrange
    class var mainOrange: UIColor { UIColor(hex: 0xFFAB49) }
    class var subGray1: UIColor { UIColor(hex: 0x666666) }
    class var subGray2: UIColor { UIColor(hex: 0x939393) }
    class var subGray3: UIColor { UIColor(hex: 0xB2B6BF) }
    class var strokeWhite: UIColor { UIColor(hex: 0xF3F3F3) }    
}

