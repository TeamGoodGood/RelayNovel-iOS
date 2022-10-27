//
//  RelayUserActivityCollectionViewCell.swift
//  Relay
//
//  Created by 이재웅 on 2022/10/27.
//

import UIKit
import SnapKit

final class RelayUserActivityCollectionViewCell: UICollectionViewCell {
    private lazy var novelActivityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17.0, weight: .bold)
        label.text = "내가 시작한 소설"
        
        return label
    }()
    
    private lazy var novelActivityNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0)
        label.text = "10개"
        
        return label
    }()
    
    private lazy var arrowLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        label.text = "􀯻"
        
        return label
    }()
    
    //TODO: configure 함수 구현할 때 private 설정 후 configure 함수 내부로 들어갈 예정
    func setupLayout() {
        [
            novelActivityLabel,
            novelActivityNumberLabel,
            arrowLabel
        ].forEach { addSubview($0) }
        
        novelActivityLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview().inset(20.0)
        }
        
        novelActivityNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(novelActivityLabel.snp.leading)
            $0.top.equalTo(novelActivityLabel.snp.bottom).offset(8.0)
        }
        
        arrowLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(-16.0)
        }
    }
}
