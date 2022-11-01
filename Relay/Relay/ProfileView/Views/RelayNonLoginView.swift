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
        let text = """
로그인하지 않은 상태입니다.
로그인/회원가입 후 이용해주세요.
"""
        label.font = .systemFont(ofSize: 15.0)
        label.numberOfLines = 2
        label.setLineHeight(text: text, lineHeight: 24.0)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        
        var titleAttribute = AttributedString("로그인/회원가입")
        titleAttribute.font = .systemFont(ofSize: 17.0, weight: .bold)
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
            $0.width.equalTo(114.0)
            $0.height.equalTo(123.0)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(28.0)
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
