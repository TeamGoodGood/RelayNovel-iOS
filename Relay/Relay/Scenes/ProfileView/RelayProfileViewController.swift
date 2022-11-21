//
//  RelayProfileViewController.swift
//  Relay
//
//  Created by 이재웅 on 2022/10/27.
//

import UIKit
import SnapKit

class RelayProfileViewController: UIViewController {
    private var isLogined: Bool = false
    
    private lazy var profileUserInfoView = RelayProfileUserInfoView(frame: .zero)
    private lazy var profileUserActivityView: RelayProfileUserActivityView = {
        let relayProfileUserActivityView = RelayProfileUserActivityView()
        
        relayProfileUserActivityView.userActivityCollectionView.delegate = self
        relayProfileUserActivityView.userActivityCollectionView.dataSource = self
    
        return relayProfileUserActivityView
    }()
    
    private lazy var nonLoginView = RelayNonLoginView(frame: .zero)
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1.0)
        
        return view
    }()
    
    private lazy var settingButton = UIBarButtonItem(
        image: UIImage(systemName: "gearshape"),
        style: .plain,
        target: self,
        action: #selector(tappedSettingButton)
    )
    
    //TODO: 알림이 있을 때 Image가 변경되도록 구현
    private lazy var noticeButton = UIBarButtonItem(
        image: UIImage(systemName: "bell"),
        style: .plain,
        target: self,
        action: #selector(tappedNoticeButton)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        //TestData
        checkLoginStatus(true)
        setupLayout()
    }
}

extension RelayProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = 100.0
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var type: ListViewType?
        
        switch indexPath.row {
        case 0:
            type = .started
        case 1:
            type = .participated
        case 2:
            type = .like
        default:
            type = .browse
        }
        
        if let type = type {
            let activityViewController = RelayActivityViewController(type: type)
            
            navigationController?.pushViewController(activityViewController, animated: true)
        }
    }
}

extension RelayProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RelayUserActivityCollectionViewCell.id, for: indexPath) as? RelayUserActivityCollectionViewCell
        cell?.configure(indexPath.row, 10)
        
        return cell ?? UICollectionViewCell()
    }
}

extension RelayProfileViewController {
    func checkLoginStatus(_ isLogined: Bool) {
        self.isLogined = isLogined
    }
    
    @objc func tappedSettingButton() {
        let settingViewController = RelaySettingViewController()
        
        navigationController?.pushViewController(settingViewController, animated: true)
    }
    
    @objc func tappedNoticeButton() {
        let noticeViewController = RelayNoticeViewController()
        
        navigationController?.pushViewController(noticeViewController, animated: true)
    }
    
    private func setupLayout() {
        setupButtonsLayout()
        
        if isLogined {
            setupProfileViewsLayout()
        } else {
            setupNonLoginViewLayout()
        }
    }
    
    private func setupButtonsLayout() {
        settingButton.tintColor = .black
        noticeButton.tintColor = .black
        
        navigationItem.rightBarButtonItems = [noticeButton, settingButton]
    }
    
    private func setupProfileViewsLayout() {
        [
            profileUserInfoView,
            separatorView,
            profileUserActivityView
        ].forEach { view.addSubview($0) }
        
        profileUserInfoView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(98.0)
        }
        
        separatorView.snp.makeConstraints {
            $0.top.equalTo(profileUserInfoView.snp.bottom).offset(30.0)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(1.0)
        }
        
        profileUserActivityView.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(30.0)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setupNonLoginViewLayout() {
        view.addSubview(nonLoginView)
        
        nonLoginView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
