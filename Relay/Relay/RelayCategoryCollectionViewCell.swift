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
    
    private var cellIndex: Int?
    
    private lazy var categoryLabel = UILabel()
    
    private lazy var checkButton: UIButton = {
        let button = UIButton()
        button.setImage(image: UIImage(systemName: "circle") ?? UIImage())
        button.tintColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1.0)
        
        return button
    }()
}

extension RelayCategoryCollectionViewCell {
    func configure(_ text: String, index: Int) {
        cellIndex = index
        categoryLabel.text = text
        categoryLabel.setFont(.body2)
        
        if cellIndex == 0 {
            layer.addBorder([.bottom], color: UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1.0), width: 1.0)
            
            checkButton.setImage(image: UIImage(systemName: "checkmark.circle") ?? UIImage())
            checkButton.tintColor = .relayPink1
        }
        
        setupLayout()
    }
    
    func changeCheckButtonImage(at index: Int) {
        let button = checkButton
        
        if index == cellIndex {
            button.setImage(image: UIImage(systemName: "checkmark.circle") ?? UIImage())
            button.tintColor = .relayPink1
        } else {
            button.setImage(image: UIImage(systemName: "circle") ?? UIImage())
            button.tintColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1.0)
        }
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
        
        checkButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(14.0)
            $0.bottom.equalToSuperview().inset(13.0)
            $0.width.equalTo(26.0)
        }
    }
}
