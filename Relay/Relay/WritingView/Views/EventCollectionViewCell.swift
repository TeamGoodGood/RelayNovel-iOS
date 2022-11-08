//
//  EventCollectionViewCell.swift
//  Relay
//
//  Created by 이창형 on 2022/11/08.
//

import UIKit
import SnapKit

class EventCollectionViewCell: UICollectionViewCell {
    let chip: UIView = {
        let chip = UIView()
        
        chip.layer.borderColor = UIColor.relayBlack.cgColor
        chip.layer.borderWidth = 1
        chip.layer.cornerRadius = 16
        chip.layer.masksToBounds = true
            
        return chip
    }()
    
    let eventButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("dkdk", for: .normal)
        button.titleLabel?.setFont(.caption1)
        button.setTitleColor(.relayBlack, for: .normal)
        
        button.layer.borderColor = UIColor.relayBlack.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        
        // 버튼 내 간격
        button.contentEdgeInsets = UIEdgeInsets(top: 7, left: 12, bottom: 7, right: 12)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        [
            eventButton
        ].forEach { contentView.addSubview($0) }
        
        eventButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
