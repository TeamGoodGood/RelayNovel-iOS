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
        label.font = .systemFont(ofSize: 17.0, weight: .bold)
        label.text = "나의 활동"
        
        return label
    }()
    
    private lazy var userActivityCollectionView: UICollectionView = {
        let collectionView = UICollectionView()
        let layout = UICollectionViewLayout()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(RelayUserActivityCollectionViewCell.self, forCellWithReuseIdentifier: RelayUserActivityCollectionViewCell.id)
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RelayProfileUserActivityView: UICollectionViewDelegateFlowLayout {
    
}

extension RelayProfileUserActivityView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
