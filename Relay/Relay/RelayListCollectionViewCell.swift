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
        
        return label
    }()
    
    private lazy var stepCountLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var relayTitleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var creationTimeLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var heartCountLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
}
