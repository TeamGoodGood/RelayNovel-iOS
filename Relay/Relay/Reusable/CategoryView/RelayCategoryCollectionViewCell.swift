//
//  RelayCategoryCollectionViewCell.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/04.
//

import UIKit
import SnapKit

class RelayCategoryCollectionViewCell: UICollectionViewCell {
    static var id: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                checkImageView.image = UIImage(systemName: "checkmark.circle")
                checkImageView.tintColor = .relayPink1
            } else {
                checkImageView.image = UIImage(systemName: "circle")
                checkImageView.tintColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1.0)
            }
        }
    }
    
    private lazy var categoryLabel = UILabel()
    
    private lazy var checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "circle")
        imageView.tintColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1.0)
        
        return imageView
    }()
}

extension RelayCategoryCollectionViewCell {
    func configure(_ text: String, index: Int) {
        categoryLabel.text = text
        categoryLabel.setFont(.body2)

        setupLayout()
    }
    
    private func setupLayout() {
        [
            categoryLabel,
            checkImageView
        ].forEach { addSubview($0) }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16.0)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().inset(12.0)
        }
        
        checkImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(14.0)
            $0.bottom.equalToSuperview().inset(13.0)
            $0.width.equalTo(26.0)
        }
    }
}
