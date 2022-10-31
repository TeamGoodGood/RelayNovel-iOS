//
//  RelayProfileUserInfoView.swift
//  Relay
//
//  Created by 이재웅 on 2022/10/27.
//

import UIKit
import SnapKit

class RelayProfileUserInfoView: UIView {
    private var startedNovelCount: Int?
    private var participatedNovelCount: Int?
    private var userName: String?
    
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .brown
        
        return imageView
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var startedNovelLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0)
        label.text = "시작한 소설"
        
        return label
    }()
    
    private lazy var participatedNovelLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0)
        label.text = "참여한 소설"
        
        return label
    }()
    
    private lazy var startedNovelCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .bold)
        
        return label
    }()
    
    private lazy var participatedNovelCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .bold)
        
        return label
    }()
    
    private lazy var textSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    
    private lazy var novelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 8.0
        
        textSeparatorView.snp.makeConstraints {
            $0.width.equalTo(1.0)
            $0.height.equalTo(18.0)
        }
        
        [
            startedNovelLabel,
            startedNovelCountLabel,
            textSeparatorView,
            participatedNovelLabel,
            participatedNovelCountLabel
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        fetchUserData()
        configure()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RelayProfileUserInfoView {
    private func setupLayout() {
        [
            userImageView,
            userNameLabel,
            novelStackView
        ].forEach { addSubview($0) }
        
        
        userImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30.0)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100.0)
            $0.height.equalTo(100.0)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(userImageView.snp.bottom).offset(24.0)
            $0.centerX.equalToSuperview()
        }
        
        novelStackView.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(12.0)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func configureUserNameLabel(_ name: String) {
        let nameAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24.0, weight: .bold)]
        let postPositionAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24.0, weight: .regular)]
        
        let name = name
        let postPosition = "님"
        let joinText = [name, postPosition].joined(separator: "")
        let attributedString = NSMutableAttributedString(string: joinText)
        let range1 = attributedString.mutableString.range(of: name)
        let range2 = attributedString.mutableString.range(of: postPosition)
        
        attributedString.addAttributes(nameAttributes, range: range1)
        attributedString.addAttributes(postPositionAttributes, range: range2)
        
        userNameLabel.attributedText = attributedString
    }
    
    func configure() {
        startedNovelCountLabel.text = "\(startedNovelCount ?? 0)"
        participatedNovelCountLabel.text = "\(participatedNovelCount ?? 0)"
        configureUserNameLabel(userName ?? "이름")
    }
    
    func fetchUserData() {
        // TestData
        startedNovelCount = 10
        participatedNovelCount = 4
        userName = "커리"
    }
}