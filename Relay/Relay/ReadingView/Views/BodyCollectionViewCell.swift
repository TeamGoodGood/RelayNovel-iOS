//
//  BodyCollectionViewCell.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/08.
//

import UIKit
import SnapKit

class BodyCollectionViewCell: UICollectionViewCell {
    static var id: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }
    
    private lazy var bodyLabel: UILabel = {
        let label = UILabel()
        let text = "릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다. 릴레이 소설 내용입니다."
        
        label.font = .systemFont(ofSize: 16.0)
        label.setLineSpacing(spacing: 8.0)
        label.setLineHeight(text: text, lineHeight: 25.0)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var nameDateLabel: UILabel = {
        let label = UILabel()
        label.text = "2022. 10. 31  초이"
        
        label.textColor = UIColor(red: 139/255, green: 139/255, blue: 139/255, alpha: 1.0)
        label.setFont(.caption2)
        
        return label
    }()
    
    private lazy var touchCountLabel: UILabel = {
        let label = UILabel()
        label.text = "1 터치"
        
        label.textColor = .relayPink1
        label.setFont(.caption2)
        
        return label
    }()
    
    private lazy var bodyLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .relayPink2
        
        return view
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
    
    func setupReadingOffLayout() {
        [
            touchCountLabel,
            bodyLineView,
            nameDateLabel,
            bodyLabel,
        ].forEach { addSubview($0) }
        
        touchCountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(27.0)
            $0.leading.equalToSuperview().inset(41.0)
        }
        
        nameDateLabel.snp.makeConstraints {
            $0.top.equalTo(bodyLineView.snp.top)
            $0.trailing.equalToSuperview().inset(20.0)
        }
        
        bodyLabel.snp.makeConstraints {
            $0.leading.equalTo(touchCountLabel.snp.leading)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.top.equalTo(touchCountLabel.snp.bottom).offset(12.0)
        }
        
        bodyLineView.snp.makeConstraints {
            $0.top.equalTo(touchCountLabel.snp.top)
            $0.leading.equalToSuperview().inset(20.0)
            $0.width.equalTo(4.0)
            $0.bottom.equalTo(bodyLabel.snp.bottom)
        }

    }
}
