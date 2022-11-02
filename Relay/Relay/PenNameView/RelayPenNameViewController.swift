//
//  RelayPenNameViewController.swift
//  Relay
//
//  Created by 이창형 on 2022/11/02.
//

import UIKit
import SnapKit

class RelayPenNameViewController: UIViewController {
    private let backButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(systemName: "arrow.left")
        
        button.setImage(image: image!)
        button.tintColor = .black
        
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "작가님의 필명을\n입력해주세요"
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 24)
        
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "필명은 12자 이하로 입력해주세요."
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12)
        label.tintColor = .systemGray5
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
}

extension RelayPenNameViewController {
    private func setupLayout() {
        [
            backButton,
            titleLabel,
            subTitleLabel
        ].forEach { view.addSubview($0) }
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(59.0)
            $0.leading.equalToSuperview().inset(18.0)
            $0.width.height.equalTo(26.0)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(backButton).offset(52.0)
            $0.leading.equalToSuperview().inset(21.0)
            $0.height.equalTo(60.0)
        }
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12.0)
            $0.leading.equalToSuperview().inset(21.0)
        }
    }
}
