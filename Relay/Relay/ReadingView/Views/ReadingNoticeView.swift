//
//  ReadingNoticeView.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/07.
//

import UIKit
import SnapKit

class ReadingNoticeView: UIView {
    private lazy var noticeLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var nameDateLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var noticeContentLabel: UILabel = {
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
