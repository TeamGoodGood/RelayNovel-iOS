//
//  RelayCategoryViewController.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/04.
//

import UIKit
import SnapKit

class RelayCategoryViewController: UIViewController {
    
    private lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RelayCategoryCollectionViewCell.self, forCellWithReuseIdentifier: RelayCategoryCollectionViewCell.id)
        
        return collectionView
    }()
    
    private lazy var applyButton: UIButton = {
        let button = UIButton()
        
        var titleAttribute = AttributedString("적용하기")
        titleAttribute.font = .systemFont(ofSize: 16.0, weight: .bold)
        titleAttribute.foregroundColor = .white
        
        button.setAttributedTitle(NSAttributedString(titleAttribute), for: .normal)
        button.backgroundColor = .relayPink1
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupLayout()
    }
}

extension RelayCategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = 53.0
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0.0
    }
}

extension RelayCategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RelayCategoryCollectionViewCell.id, for: indexPath) as? RelayCategoryCollectionViewCell else { return UICollectionViewCell() }
        cell.configure()
        
        return cell
    }
}

extension RelayCategoryViewController {
    private func setupLayout() {
        view.addSubview(categoryCollectionView)
        
        categoryCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20.0)
            $0.leading.equalTo(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.bottom.equalToSuperview()
        }
    }
}
