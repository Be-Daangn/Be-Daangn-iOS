//
//  UIViewController+presentAlert.swift
//  Be-Daangn-iOS
//
//  Created by taehy.k on 2021/05/19.
//

import UIKit

extension UIViewController {
    
    // MARK: 취소와 확인이 뜨는 UIAlertController
    func presentAlertWithCancel(title: String,
                      message: String? = nil,
                      okAction: ((UIAlertAction)->Void)?,
                      cancelAction: ((UIAlertAction)->Void)? = nil,
                      completion: (() -> Void)? = nil) {
        
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: cancelAction)
        alert.addAction(cancelAction)

        self.present(alert, animated: true, completion: completion)
    }
    
    // MARK: 확인이 뜨는 UIAlertController
    func presentAlert(title: String,
                      message: String? = nil,
                      okAction: ((UIAlertAction)->Void)?,
                      preferredStyle style: UIAlertController.Style = .alert,
                      completion: (() -> Void)? = nil) {
        
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: completion)
        
    }


}
