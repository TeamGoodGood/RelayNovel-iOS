//
//  RelayUserActivityCollectionViewCell.swift
//  Relay
//
//  Created by 이재웅 on 2022/10/27.
//

import UIKit
import SnapKit

final class RelayUserActivityCollectionViewCell: UICollectionViewCell {
    static var id: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }
    
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
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .black
        
        return imageView
    }()
    
    //TODO: configure 함수 구현할 때 private 설정 후 configure 함수 내부로 들어갈 예정
    func setupLayout() {
        layer.cornerRadius = 5.0
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
        backgroundColor = .systemGray6
        
        [
            novelActivityLabel,
            novelActivityNumberLabel,
            arrowImageView
        ].forEach { addSubview($0) }
        
        novelActivityLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview().inset(20.0)
        }
        
        novelActivityNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(novelActivityLabel.snp.leading)
            $0.top.equalTo(novelActivityLabel.snp.bottom).offset(8.0)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(16.0)
            $0.height.equalTo(26.0)
            $0.trailing.equalToSuperview().inset(16.0)
        }
    }
}