//
//  TouchCollectionViewCell.swift
//  Relay
//
//  Created by 이창형 on 2022/11/08.
//

import UIKit
import SnapKit

class TouchCollectionViewCell: UICollectionViewCell {
    let chip: UIView = {
        let chip = UIView()
        
        chip.layer.borderColor = UIColor.relayBlack.cgColor
        chip.layer.borderWidth = 1
        chip.layer.cornerRadius = 24
        chip.layer.masksToBounds = true
            
        return chip
    }()
    
    let touchButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("dkdk", for: .normal)
        button.titleLabel?.setFont(.caption1)
        button.setTitleColor(.relayBlack, for: .normal)
        
        button.layer.borderColor = UIColor.relayBlack.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 24
        button.layer.masksToBounds = true
        
        button.contentEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        
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
            touchButton
        ].forEach { contentView.addSubview($0) }
        
        touchButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
