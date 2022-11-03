//
//  BrowsingTitleView.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/03.
//

import UIKit
import SnapKit

class BrowsingTitleView: UIView {
    
    private lazy var titleButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private lazy var titleUnderLineView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
