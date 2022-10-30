//
//  RelayProfileViewController.swift
//  Relay
//
//  Created by 이재웅 on 2022/10/27.
//

import UIKit
import SnapKit

class RelayProfileViewController: UIViewController {
    private lazy var profileUserInfoView = RelayProfileUserInfoView(frame: .zero)
    private lazy var profileUserActivityView = RelayProfileUserActivityView(frame: .zero)
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    
    private lazy var profileSettingButton: UIButton = {
        let button = UIButton()
        
        var titleAttribute = AttributedString("프로필 수정")
        titleAttribute.font = .systemFont(ofSize: 12.0, weight: .regular)
        titleAttribute.foregroundColor = .gray
        
        button.setAttributedTitle(NSAttributedString(titleAttribute), for: .normal)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 16.0
        
        return button
    }()
    
    private lazy var environmentSettingButton: UIButton = {
        let button = UIButton()
        
        //TODO: Image로 변경
        var titleAttribute = AttributedString("􀣋")
        titleAttribute.font = .systemFont(ofSize: 22.0)
        titleAttribute.foregroundColor = .black
        
        button.setAttributedTitle(NSAttributedString(titleAttribute), for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupLayout()
    }
}

extension RelayProfileViewController {
    private func setupLayout() {
        [
            profileSettingButton,
            environmentSettingButton,
            profileUserInfoView,
            separatorView,
            profileUserActivityView
        ].forEach { view.addSubview($0) }
        
        environmentSettingButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(62.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.width.equalTo(27.0)
            $0.height.equalTo(27.0)
        }
        
        profileSettingButton.snp.makeConstraints {
            $0.top.equalTo(environmentSettingButton.snp.top)
            $0.trailing.equalTo(environmentSettingButton.snp.leading).offset(-8.0)
            $0.width.equalTo(83.0)
            $0.height.equalTo(30.0)
        }
        
        profileUserInfoView.snp.makeConstraints {
            $0.top.equalTo(profileSettingButton.snp.bottom).offset(24.0)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(183.0)
        }
        
        separatorView.snp.makeConstraints {
            $0.top.equalTo(profileUserInfoView.snp.bottom).offset(52.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.height.equalTo(1.0)
        }
        
        profileUserActivityView.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(28.0)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
