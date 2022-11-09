//
//  RelayDeleteAccountUserActivityView.swift
//  Relay
//
//  Created by seungyeon oh on 2022/11/08.
//

import UIKit
import SnapKit

class RelayDeleteAccountUserActivityView: UIView {
    
    private var userName: String?
    private var startedNovelCount: Int?
    private var participatedNovelCount: Int?
    
    private var accountLabel: UILabel = {
        let label = UILabel()
        let content = "이브님의 활동"
        label.setLineHeight(text: content, lineHeight: 30.0)
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16.0)
        label.textColor = .systemGray
        
        return label
    }()
    
    private var accountActivityLabel: UILabel = {
        let label = UILabel()
        let content = "시작한 릴레이 3개 \n참여한 릴레이 13개"
        label.numberOfLines = 2
        label.setLineHeight(text: content, lineHeight: 35.0)
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 24.0)
        
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
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RelayDeleteAccountUserActivityView {
    private func setupLayout() {
        [
            accountLabel,
            accountActivityLabel,
            deleteAccountImageView,
            dividerView
        ].forEach { addSubview($0) }
        
        accountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(110.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
        accountActivityLabel.snp.makeConstraints {
            $0.top.equalTo(accountLabel.snp.bottom).offset(20.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
        deleteAccountImageView.snp.makeConstraints {
            $0.top.equalTo(accountActivityLabel.snp.bottom).offset(90.0)
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
    
    func fetchUserData() {
        userName = "이브"
        startedNovelCount = 3
        participatedNovelCount = 13
    }
}
