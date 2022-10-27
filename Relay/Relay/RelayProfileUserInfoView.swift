//
//  RelayProfileUserInfoView.swift
//  Relay
//
//  Created by 이재웅 on 2022/10/27.
//

import UIKit
import SnapKit

class RelayProfileUserInfoView: UIView {
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var startedNovelLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var participatedNovelLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var startedNovelCountLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var participatedNovelCountLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
