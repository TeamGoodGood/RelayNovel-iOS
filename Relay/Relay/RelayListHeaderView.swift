//
//  RelayListHeaderView.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/01.
//

import UIKit
import SnapKit

class RelayListHeaderView: UIView {
    private lazy var listTitleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var listMenuButton: UIButton = {
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

