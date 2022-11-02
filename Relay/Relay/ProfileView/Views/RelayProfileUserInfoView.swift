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
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28.0, weight: .bold)
        
        return label
    }()
    
    private lazy var usersRelayCountLabel = UILabel()
    
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
            userNameLabel,
            usersRelayCountLabel
        ].forEach { addSubview($0) }
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(31.0)
            $0.leading.equalToSuperview().inset(20.0)
        }
        
        usersRelayCountLabel.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(16.0)
            $0.leading.equalTo(userNameLabel.snp.leading)
        }
    }
    
    private func setUsersRelayCountLabel(_ startedRelayCount: Int, _ participatedRelayCount: Int) {
        let numberAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.magenta
        ]
        
        let startedStr = "시작한 릴레이"
        let participatedStr = "참여한 릴레이"
        let dot = "·"
        let startedRelaysStr = "\(startedRelayCount)"
        let participatedRelaysStr = "\(participatedRelayCount)"
        
        let joinText = [startedStr, startedRelaysStr, dot, participatedStr, participatedRelaysStr].joined(separator: " ")
        let attributedString = NSMutableAttributedString(string: joinText)
        
        let range1 = attributedString.mutableString.range(of: startedRelaysStr)
        let range2 = attributedString.mutableString.range(of: participatedRelaysStr)
        
        [range1, range2].forEach { attributedString.addAttributes(numberAttributes, range: $0) }
        
        usersRelayCountLabel.attributedText = attributedString
        usersRelayCountLabel.setFont(.caption1)
    }
    
    func configure() {
        userNameLabel.text = userName
        setUsersRelayCountLabel(startedNovelCount ?? 0, participatedNovelCount ?? 0)
    }
    
    func fetchUserData() {
        // TestData
        startedNovelCount = 10
        participatedNovelCount = 4
        userName = "커리"
    }
}
