//
//  RelayDeleteAccountAgreementView.swift
//  Relay
//
//  Created by seungyeon oh on 2022/11/09.
//

import UIKit
import SnapKit

class RelayDeleteAccountAgreementView: UIView {
    
    private let agreementButton: UIButton = {
        let button = UIButton(type: .custom)
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: config)
        
        button.setImage(image, for: .normal)
        button.setTitle("안내사항을 확인하고 회원탈퇴에 동의", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.titleEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 0)
        button.tintColor = .relayGray2
        button.contentHorizontalAlignment = .leading
        button.addTarget(self,action: #selector(agreementToggle), for: .touchUpInside)
        
        return button
    }()
    
    private let firstCheckImageView: UIImageView = {
        let check = UIImageView()
        check.image = UIImage(systemName: "checkmark")
        check.tintColor = .relayGray2
        
        return check
    }()
    
    private let firstCheckLabel: UILabel = {
        let check = UILabel()
        let content = "회원님이 작성한 릴레이는 자동으로 삭제되지 않습니다."
        check.setLineHeight(text: content, lineHeight: 13.0)
        check.textAlignment = .left
        check.font = .systemFont(ofSize: 13.0)
        check.textColor = .relayGray
        
        return check
    }()
    
    private let secondCheckImageView: UIImageView = {
        let check = UIImageView()
        check.image = UIImage(systemName: "checkmark")
        check.tintColor = .relayGray2
        
        return check
    }()
    
    private let secondCheckLabel: UILabel = {
        let check = UILabel()
        let content = "연결된 소셜 계정 정보가 삭제됩니다."
        check.setLineHeight(text: content, lineHeight: 13.0)
        check.textAlignment = .left
        check.font = .systemFont(ofSize: 13.0)
        check.textColor = .relayGray
        
        return check
    }()
    
    private let deleteAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("탈퇴하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .relayGray2
        button.layer.cornerRadius = 12
        button.addTarget(self,action: #selector(tapAgreementButton), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func agreementToggle(_ sender: UIButton) {
        if (sender.tag == 0) {
            agreementButton.tintColor = .relayPink1
            firstCheckImageView.tintColor = .relayPink1
            secondCheckImageView.tintColor = .relayPink1
            
            deleteAccountButton.setTitleColor(.white, for: .normal)
            deleteAccountButton.backgroundColor = .relayPink1
            
            sender.tag = 1
        } else {
            agreementButton.tintColor = .relayGray2
            firstCheckImageView.tintColor = .relayGray2
            secondCheckImageView.tintColor = .relayGray2
            
            deleteAccountButton.setTitleColor(.black, for: .normal)
            deleteAccountButton.backgroundColor = .relayGray2
            
            sender.tag = 0
        }
    }
    @objc func tapAgreementButton(_ sender: UIButton) {
        if deleteAccountButton.backgroundColor == .relayPink1 {
            //추후 탈퇴 처리 구현
        }
    }
}

extension RelayDeleteAccountAgreementView {
    private func setupLayout() {
        [
            agreementButton,
            firstCheckImageView,
            firstCheckLabel,
            secondCheckImageView,
            secondCheckLabel,
            deleteAccountButton
        ].forEach { addSubview($0) }
        
        agreementButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
        firstCheckImageView.snp.makeConstraints {
            $0.top.equalTo(agreementButton.snp.bottom).offset(20.0)
            $0.leading.equalToSuperview().inset(25.0)
            $0.width.equalTo(19.0)
            $0.height.equalTo(19.0)
        }
        firstCheckLabel.snp.makeConstraints {
            $0.top.equalTo(agreementButton.snp.bottom).offset(22.0)
            $0.leading.equalTo(firstCheckImageView.snp.trailing).offset(12.0)
        }
        secondCheckImageView.snp.makeConstraints {
            $0.top.equalTo(firstCheckImageView.snp.bottom).offset(20.0)
            $0.leading.equalToSuperview().inset(25.0)
            $0.width.equalTo(19.0)
            $0.height.equalTo(19.0)
        }
        secondCheckLabel.snp.makeConstraints {
            $0.top.equalTo(firstCheckLabel.snp.bottom).offset(26.0)
            $0.leading.equalTo(firstCheckImageView.snp.trailing).offset(12.0)
        }
        deleteAccountButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(60.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.width.equalTo(350.0)
            $0.height.equalTo(56.0)
        }
    }
}
