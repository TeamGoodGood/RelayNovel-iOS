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
}
