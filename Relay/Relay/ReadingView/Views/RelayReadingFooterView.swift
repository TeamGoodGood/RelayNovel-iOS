//
//  RelayReadingFooterView.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/07.
//

import UIKit
import SnapKit

class RelayReadingFooterView: UIView {
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private lazy var batonButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
