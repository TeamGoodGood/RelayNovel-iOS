//
//  Extension+UILabel.swift
//  Relay
//
//  Created by 이재웅 on 2022/10/31.
//

import UIKit

extension UILabel {
    func setLineHeight(text: String?, lineHeight: CGFloat) {
        if let text = text {
            let style = NSMutableParagraphStyle()
            style.maximumLineHeight = lineHeight
            style.minimumLineHeight = lineHeight
            
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: style,
                .baselineOffset: (lineHeight - font.lineHeight) / 4
            ]
            
            let attributeString = NSAttributedString(string: text, attributes: attributes)
            
            self.attributedText = attributeString
        }
    }
}
