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
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        label.text = "나의 활동"
        
        return label
    }()
    
    private lazy var userActivityCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.minimumLineSpacing = 16.0
        
        collectionView.delegate = self
        collectionView.dataSource = self
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

extension RelayProfileUserActivityView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = 100.0
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: 세부페이지로 이동 구현
        print("tapped \(indexPath.row) cell")
    }
}

extension RelayProfileUserActivityView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RelayUserActivityCollectionViewCell.id, for: indexPath) as? RelayUserActivityCollectionViewCell
        cell?.configure(indexPath.row, 10)
        
        return cell ?? UICollectionViewCell()
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
