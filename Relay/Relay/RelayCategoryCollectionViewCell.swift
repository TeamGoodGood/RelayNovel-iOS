//
//  RelayCategoryCollectionViewCell.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/04.
//

import UIKit
import SnapKit

class RelayCategoryCollectionViewCell: UICollectionViewCell {
    private lazy var categoryLabel = UILabel()
    
    private lazy var checkButton: UIButton = {
        let button = UIButton()
        button.setImage(image: UIImage(systemName: "circle") ?? UIImage())
        button.tintColor = .relayBlack
        
        return button
    }()
}
