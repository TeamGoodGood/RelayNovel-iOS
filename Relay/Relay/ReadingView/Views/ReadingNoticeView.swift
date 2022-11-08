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
        label.text = "공지"
        label.setFont(.body1)
        
        return label
    }()
    
    private lazy var nameDateLabel: UILabel = {
        let label = UILabel()
        label.text = "2022. 10. 31  초이"
        label.setFont(.caption2)
        
        return label
    }()
    
    private lazy var noticeContentLabel: UILabel = {
        let label = UILabel()
        label.text = "릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다."
        label.setFont(.body2)
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
