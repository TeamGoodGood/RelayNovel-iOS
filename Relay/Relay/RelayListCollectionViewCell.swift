//
//  RelayListCollectionViewCell.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/02.
//

import UIKit
import SnapKit

class RelayListCollectionViewCell: UICollectionViewCell {
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0)
        label.textColor = .white
        
        label.clipsToBounds = true
        label.backgroundColor = .systemPink
        label.layer.cornerRadius = 12.0
        
        return label
    }()
    
    private lazy var stepCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0)
        
        return label
    }()
    
    private lazy var relayTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17.0, weight: .bold)
        
        return label
    }()
    
    private lazy var bgmTagLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0)
        
        return label
    }()
    
    private lazy var creationTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0)
        
        return label
    }()
    
    private lazy var heartCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0)
        label.textColor = .systemPink
        
        return label
    }()
}
