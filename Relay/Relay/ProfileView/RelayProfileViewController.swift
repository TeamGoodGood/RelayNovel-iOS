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
    private lazy var profileUserActivityView = RelayProfileUserActivityView(frame: .zero)
    private lazy var nonLoginView = RelayNonLoginView(frame: .zero)
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        //TestData
        checkLoginStatus(true)
        setupLayout()
    }
}

extension RelayProfileViewController {
    func checkLoginStatus(_ isLogined: Bool) {
        self.isLogined = isLogined
    }
    
    //TODO: tappedSettingButton 메소드 동작구현
    @objc func tappedSettingButton() {
        print("touched SettingButton")
    }
    
    //TODO: tappedNoticeButton 메소드 동작구현
    @objc func tappedNoticeButton() {
        print("touched NoticeButton")
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
        let settingButton = UIBarButtonItem(
            image: UIImage(systemName: "gearshape"),
            style: .plain,
            target: self,
            action: #selector(tappedSettingButton)
        )
        
        let noticeButton = UIBarButtonItem(
            image: UIImage(systemName: "bell"),
            style: .plain,
            target: self,
            action: #selector(tappedNoticeButton)
        )
        
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
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
