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
        button.tintColor = .systemGray4
        button.contentHorizontalAlignment = .leading

        return button
    }()
    
    private let checkImageView: UIImageView = {
        let check = UIImageView()
        check.image = UIImage(systemName: "checkmark")
        check.tintColor = .systemGray4
        
        return check
    }()
    
    private let checkLabel: UILabel = {
        let check = UILabel()
        let content = "회원님이 작성한 릴레이는 자동으로 삭제되지 않습니다."
        check.setLineHeight(text: content, lineHeight: 30.0)
        check.textAlignment = .left
        check.font = .systemFont(ofSize: 16.0)
        check.textColor = .systemGray
        
        return check
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
            agreementButton,
            checkImageView
        ].forEach { addSubview($0) }
        
        agreementButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
        checkImageView.snp.makeConstraints {
            $0.top.equalTo(agreementButton.snp.bottom).offset(20.0)
            $0.leading.equalToSuperview().inset(25.0)
            $0.width.equalTo(19.0)
            $0.height.equalTo(19.0)
        }
    }
}
