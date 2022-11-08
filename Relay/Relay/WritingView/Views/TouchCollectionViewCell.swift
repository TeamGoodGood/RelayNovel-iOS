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
    
    let touchLabel: UILabel = {
        let label = UILabel()
        
        label.text = "dkdk"
        label.setFont(.caption1)
        
        return label
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
            chip,
        ].forEach { contentView.addSubview($0) }
        chip.addSubview(touchLabel)
        
        chip.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        touchLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15.0)
            $0.leading.equalToSuperview().inset(15.0)
            $0.trailing.equalToSuperview().inset(15.0)
            $0.bottom.equalToSuperview().inset(15.0)
        }
    }
}
