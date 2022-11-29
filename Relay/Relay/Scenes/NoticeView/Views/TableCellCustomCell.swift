//
//  TableCellCustomCell.swift
//  Relay
//
//  Created by 이창형 on 2022/11/09.
//

import UIKit
import SnapKit

class TableCellCustomCell: UITableViewCell {
    
    static let reuseIdentifier: String = "MainTableViewCell"
    
    private let dividerBottom: UIView = {
        let view = UIView()
        view.backgroundColor = .relayGray2
        
        return view
    }()
    
    private let lillaImageView: UIImageView = {
       let imageView = UIImageView()
       let image = UIImage(named: "onboardingImage")
        
       imageView.image = image
        
       return imageView
    }()
    
    private let noticeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "안녕하세요"
        label.setFont(.caption1)
        label.textColor = .relayBlack
        
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "1시간전"
        label.setFont(.caption2)
        label.textColor = .relayGray
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        [
            lillaImageView,
            noticeLabel,
            timeLabel,
            dividerBottom
        ].forEach { addSubview($0) }
        
        lillaImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.width.equalTo(40.0)
            $0.height.equalTo(43.0)
        }
        noticeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20.0)
            $0.leading.equalTo(lillaImageView.snp.trailing).offset(24.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(noticeLabel.snp.bottom).offset(8.0)
            $0.leading.equalTo(lillaImageView.snp.trailing).offset(24.0)
        }
        dividerBottom.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1.0)
        }
    }
}
