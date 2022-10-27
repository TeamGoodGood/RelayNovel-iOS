//
//  RelayUserActivityCollectionViewCell.swift
//  Relay
//
//  Created by 이재웅 on 2022/10/27.
//

import UIKit
import SnapKit

final class RelayUserActivityCollectionViewCell: UICollectionViewCell {
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
    
    private lazy var arrowLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        label.text = "􀯻"
        
        return label
    }()
}
