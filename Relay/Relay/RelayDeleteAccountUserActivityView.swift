//
//  RelayDeleteAccountUserActivityView.swift
//  Relay
//
//  Created by seungyeon oh on 2022/11/08.
//

import UIKit
import SnapKit

class RelayDeleteAccountUserActivityView: UIView {
    
    private var userName:String?
    private var startedNovelCount: Int?
    private var participatedNovelCount: Int?
    
    private var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        
        return label
    }()
    
    private var accountActivityCountLabel: UILabel = {
        let label = UILabel()
        let content = ""
   
        return label
    }()
    
    private var deleteAccountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "RelayLilla")
        
        return imageView
    }()
    
    private var dividerView: UIView = {
        let divider = UIView()
        divider.backgroundColor = .relayGray2
        
        return divider
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        fetchUserData()
        setupLayout()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RelayDeleteAccountUserActivityView {
    private func setupLayout() {
        [
            userNameLabel,
            accountActivityCountLabel,
            deleteAccountImageView,
            dividerView
        ].forEach { addSubview($0) }
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(110.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
        accountActivityCountLabel.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(20.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
        deleteAccountImageView.snp.makeConstraints {
            $0.top.equalTo(accountActivityCountLabel.snp.bottom).offset(90.0)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(248.0)
            $0.height.equalTo(81.0)
        }
        dividerView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(8.0)
        }
    }
    private func accountLabel(_ userName: String) {
        
        let userNameStr = userName
        let userActivityStr = "님의 활동"
        
        let joinText = [userNameStr, userActivityStr].joined(separator: "")
        let attributedString = NSMutableAttributedString(string: joinText)
        
        userNameLabel.attributedText = attributedString
        userNameLabel.setFont(.body2)
        userNameLabel.textColor = .relayGray
        userNameLabel.textAlignment = .left
    }
    
    private func accountActivityLabel(_ startedRelayCount: Int, _ participatedRelayCount: Int) {
        
        let startedStr = "시작한 릴레이 "
        let participatedStr = "참여한 릴레이 "
        let startedRelaysStr = "\(startedRelayCount)"
        let participatedRelaysStr = "\(participatedRelayCount)"
        let unit = "개"
        let enter = "\n"
        
        let joinText = [startedStr, startedRelaysStr, unit, enter, participatedStr, participatedRelaysStr, unit].joined(separator: "")
        let attributedString = NSMutableAttributedString(string: joinText)
        
        accountActivityCountLabel.attributedText = attributedString
        accountActivityCountLabel.setFont(.display1)
        accountActivityCountLabel.textColor = .black
        accountActivityCountLabel.numberOfLines = 2
        accountActivityCountLabel.textAlignment = .left
        accountActivityCountLabel.setLineHeight(text: joinText, lineHeight: 36.0)
    }
    
    func configure() {
        userNameLabel.text = userName
        accountActivityLabel(startedNovelCount ?? 0, participatedNovelCount ?? 0)
    }
    
    func fetchUserData() {
        userName = "이브"
        startedNovelCount = 3
        participatedNovelCount = 13
    }
}
