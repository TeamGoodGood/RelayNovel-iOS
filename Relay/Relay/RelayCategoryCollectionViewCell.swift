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
    
    private lazy var categoryLabel = UILabel()
    
    private lazy var checkButton: UIButton = {
        let button = UIButton()
        button.setImage(image: UIImage(systemName: "circle") ?? UIImage())
        button.tintColor = .relayBlack
        
        return button
    }()
}

extension RelayCategoryCollectionViewCell {
    func configure() {
        categoryLabel.text = "로맨스"
        
        setupLayout()
    }
    
    private func setupLayout() {
        [
            categoryLabel,
            checkButton
        ].forEach { addSubview($0) }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16.0)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().inset(12.0)
        }
    }
}