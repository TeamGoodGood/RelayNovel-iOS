//
//  Extension+CALayer.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/02.
//

import UIKit

extension CALayer {
    /// 원하는 방향의 edge를 전달해서 해당 edge에만 border를 설정할 수 있는 메소드
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
