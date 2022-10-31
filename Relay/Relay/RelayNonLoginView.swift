//
//  RelayNonLoginView.swift
//  Relay
//
//  Created by 이재웅 on 2022/10/31.
//

import UIKit
import SnapKit

class RelayNonLoginView: UIView {
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        //TODO: backgroundColor를 Logo Image로 변경필요
        imageView.backgroundColor = .blue
        
        return imageView
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0)
        label.text = """
로그인하지 않은 상태입니다.
로그인/회원가입 후 이용해주세요.
"""
        
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        
        var titleAttribute = AttributedString("로그인/회원가입")
        titleAttribute.font = .systemFont(ofSize: 16.0, weight: .medium)
        titleAttribute.foregroundColor = .white
        
        button.setAttributedTitle(NSAttributedString(titleAttribute), for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12.0
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        [
            logoImageView,
            descriptionLabel,
            loginButton
        ].forEach { addSubview($0) }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(193.0)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(142.0)
            $0.height.equalTo(107.0)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(24.0)
            $0.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(24.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.height.equalTo(56.0)
        }
    }
}