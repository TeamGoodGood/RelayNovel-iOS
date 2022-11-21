//
//  RelayListView.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/01.
//

import UIKit
import SnapKit

class RelayListView: UIView {
    var listHeaderView: RelayListHeaderView?
    lazy var listCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(RelayListCollectionViewCell.self, forCellWithReuseIdentifier: RelayListCollectionViewCell.id)
        
        return collectionView
    }()
    
    init(frame: CGRect, type: ListViewType) {
        super.init(frame: frame)
        
        setRelayListHeaderView(type)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RelayListView {
    private func setupLayout() {
        guard let listHeaderView = listHeaderView else { return }
        
        [
            listHeaderView,
            listCollectionView
        ].forEach { addSubview($0) }
        
        listHeaderView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(63.0)
        }
        
        listCollectionView.snp.makeConstraints {
            $0.top.equalTo(listHeaderView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setRelayListHeaderView(_ viewType: ListViewType) {
        switch viewType {
        case .browse:
            listHeaderView = RelayListHeaderView(frame: .zero, type: .browse)
        case .like:
            listHeaderView = RelayListHeaderView(frame: .zero, type: .like)
        case .started:
            listHeaderView = RelayListHeaderView(frame: .zero, type: .started)
        case .participated:
            listHeaderView = RelayListHeaderView(frame: .zero, type: .participated)
        }
    }
}

enum ListViewType {
    case browse
    case started
    case participated
    case like
}
