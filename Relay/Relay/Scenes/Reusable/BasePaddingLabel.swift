//
//  BasePaddingLabel.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/02.
//

import UIKit

class BasePaddingLabel: UILabel {
    var padding = UIEdgeInsets(top: 5.0, left: 10.0, bottom: 5.0, right: 10.0)

    convenience init(padding: UIEdgeInsets) {
        self.init()
        self.padding = padding
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right

        return contentSize
    }
}
