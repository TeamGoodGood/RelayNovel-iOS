//
//  RelayReadingCoverView.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/07.
//

import UIKit
import SnapKit

class RelayReadingCoverView: UIView {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var stepCountCategoryLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var playlistLabel: UILabel = {
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
