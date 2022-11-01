//
//  Extention+UIButton.swift
//  Relay
//
//  Created by 이창형 on 2022/11/01.
//

import UIKit

extension UIButton {
    func setImage(systemName: String) {
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        
        imageView?.contentMode = .scaleAspectFit
        
        setImage(UIImage(systemName: systemName), for: .normal)
    }
}

