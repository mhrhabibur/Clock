//
//  Extension.swift
//  Clock App
//
//  Created by Habibur Rahman on 10/27/24.
//

import Foundation
import UIKit
extension UIViewController {
    func showToast(_ message: String, duration: TimeInterval = 2.0) {
        let toastLabel = UILabel()
        toastLabel.text = message
        toastLabel.textColor = .white
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont.systemFont(ofSize: 16)
        toastLabel.numberOfLines = 0
        toastLabel.alpha = 0.0
        toastLabel.layer.cornerRadius = 20
        toastLabel.clipsToBounds = true
        
        let padding: CGFloat = 36
        toastLabel.frame = CGRect(x: padding, y: self.view.frame.size.height - 160, width: self.view.frame.size.width - 2 * padding, height: 50)
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 0.5, animations: {
            toastLabel.alpha = 1.0
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: duration, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: { _ in
                toastLabel.removeFromSuperview()
            })
        }
    }
}
