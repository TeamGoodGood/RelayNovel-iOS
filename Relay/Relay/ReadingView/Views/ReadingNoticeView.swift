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
        label.textColor = .relayGray
        label.setFont(.caption2)
        
        return label
    }()
    
    private lazy var noticeContentLabel: UILabel = {
        let label = UILabel()
        let text = "릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다."
        label.font = .systemFont(ofSize: 16.0)
        label.setLineHeight(text: text, lineHeight: 25.0)
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ReadingNoticeView {
    private func setupLayout() {
        [
            noticeLabel,
            nameDateLabel,
            noticeContentLabel
        ].forEach { addSubview($0) }
        
        noticeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25.0)
            $0.leading.equalToSuperview().inset(20.0)
        }
        
        nameDateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(27.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
        
        noticeContentLabel.snp.makeConstraints {
            $0.top.equalTo(noticeLabel.snp.bottom).offset(10.0)
            $0.leading.equalTo(noticeLabel.snp.leading)
            $0.trailing.equalTo(nameDateLabel.snp.trailing)
            $0.bottom.equalToSuperview().inset(20.0)
        }
    }
}
