//
//  RelayProfileUserActivityView.swift
//  Relay
//
//  Created by 이재웅 on 2022/10/27.
//

import UIKit
import SnapKit

class RelayProfileUserActivityView: UIView {
    private lazy var activityLabel: UILabel = {
        let label = UILabel()
        label.text = "나의 활동"
        label.setFont(.body1)
        
        return label
    }()
    
    lazy var userActivityCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.minimumLineSpacing = 16.0
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(RelayUserActivityCollectionViewCell.self, forCellWithReuseIdentifier: RelayUserActivityCollectionViewCell.id)
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RelayProfileUserActivityView {
    private func setupLayout() {
        [
            activityLabel,
            userActivityCollectionView
        ].forEach{ addSubview($0) }
        
        activityLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20.0)
        }
        
        userActivityCollectionView.snp.makeConstraints {
            $0.top.equalTo(activityLabel.snp.bottom).offset(20.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.bottom.equalToSuperview()
        }
    }
}
