//
//  Extention+UIButton.swift
//  Relay
//
//  Created by 이창형 on 2022/11/01.
//

import UIKit

extension UIButton {
    func setImage(image: UIImage) {
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        
        imageView?.contentMode = .scaleAspectFit
        
        setImage(image, for: .normal)
    }
}

