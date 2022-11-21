//
//  RelayActivityViewController.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/21.
//

import UIKit
import SnapKit

class RelayActivityViewController: UIViewController {
    var type: ListViewType
    
    private lazy var relayListView = RelayListView(frame: .zero, type: type)
    
    init(type: ListViewType) {
        self.type = type
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        relayListView.listCollectionView.delegate = self
        relayListView.listCollectionView.dataSource = self
        
        setupLayout()
    }
}

extension RelayActivityViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = 118.0
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let readingViewController = RelayReadingViewController()
        
        navigationController?.pushViewController(readingViewController, animated: true)
    }
}

extension RelayActivityViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //TODO: Story 개수에 따라 변경되도록 수정
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RelayListCollectionViewCell.id, for: indexPath) as? RelayListCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(indexPath.row)
        
        return cell
    }

}

extension RelayActivityViewController {
    private func setupLayout() {
        view.addSubview(relayListView)
        
        relayListView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
