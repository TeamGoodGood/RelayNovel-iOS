//
//  RelayProfileUserActivityView.swift
//  Relay
//
//  Created by 이재웅 on 2022/10/27.
//

import UIKit
import SnapKit

class RelayProfileUserActivityView: UIView {
    private lazy var activiyLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var userActivityCollectionView: UICollectionView = {
        let collectionView = UICollectionView()
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
