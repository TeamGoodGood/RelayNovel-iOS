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
    
    enum RelayFont {
        case body1
        case body2
        case caption1
        case caption2
        case caption3
        case icon1
        case icon2
        case display1
    }
    
    /// Relay 폰트를 설정할 수 있는 메소드
    /// - Warning: body2 폰트를 사용하는 경우, 해당 label에 text를 먼저 설정한 후 메소드를 실행해야 작동됩니다.
    func setFont(_ font: RelayFont) {
        switch font {
        case .body1:
            self.font = .systemFont(ofSize: 17.0, weight: .bold)
        case .body2:
            self.font = .systemFont(ofSize: 16.0, weight: .regular)
            self.setLineSpacing(spacing: 25.0)
        case .caption1:
            self.font = .systemFont(ofSize: 15.0, weight: .regular)
        case .caption2:
            self.font = .systemFont(ofSize: 13.0, weight: .regular)
        case .caption3:
            self.font = .systemFont(ofSize: 11.0, weight: .bold)
        case .icon1:
            self.font = .systemFont(ofSize: 16.0, weight: .bold)
        case .icon2:
            self.font = .systemFont(ofSize: 22.0, weight: .regular)
        case .display1:
            self.font = .systemFont(ofSize: 24.0, weight: .bold)
        }
    }
    
    func setLineSpacing(spacing: CGFloat) {
        guard let text = text else { return }
        
        let attributeString = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()
        
        style.lineSpacing = spacing
        attributeString.addAttribute(.paragraphStyle,
                                     value: style,
                                     range: NSRange(location: 0, length: attributeString.length)
        )
        
        attributedText = attributeString
    }
}
