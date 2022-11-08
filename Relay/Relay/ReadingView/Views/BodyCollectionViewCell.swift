//
//  BodyCollectionViewCell.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/08.
//

import UIKit
import SnapKit

class BodyCollectionViewCell: UICollectionViewCell {
    private lazy var bodyLabel: UILabel = {
        let label = UILabel()
        let text = "릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다."
        
        label.font = .systemFont(ofSize: 16.0)
        label.setLineSpacing(spacing: 8.0)
        label.setLineHeight(text: text, lineHeight: 25.0)
        label.numberOfLines = 0
        
        return label
    }()
}

extension BodyCollectionViewCell {
    func setupLayout() {
        addSubview(bodyLabel)
        
        bodyLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.bottom.equalToSuperview()
        }
    }
}
