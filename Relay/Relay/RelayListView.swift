//
//  RelayListView.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/01.
//

import UIKit
import SnapKit

class RelayListView: UIView {
    private lazy var listHeaderView = RelayListHeaderView(frame: .zero)
    private lazy var listCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
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

extension RelayListView: UICollectionViewDelegateFlowLayout {
    
}

extension RelayListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }

}

extension RelayListView {
    private func setupLayout() {
        [
            listHeaderView,
            listCollectionView
        ].forEach { addSubview($0) }
        
        listHeaderView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(84.0)
        }
        
        listCollectionView.snp.makeConstraints {
            $0.top.equalTo(listHeaderView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
