//
//  Extension+CALayer.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/02.
//

import UIKit

extension CALayer {
    func addBorder(_ edges: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in edges {
            let border = CALayer()
            
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect(x: 0.0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect(x: 0.0, y: 0.0, width: width, height: frame.width)
                break
            case UIRectEdge.right:
                border.frame = CGRect(x: frame.height - width, y: 0.0, width: width, height: frame.width)
                break
            default:
                break
            }
            
            border.backgroundColor = color.cgColor
            
            self.addSublayer(border)
        }
    }
}
