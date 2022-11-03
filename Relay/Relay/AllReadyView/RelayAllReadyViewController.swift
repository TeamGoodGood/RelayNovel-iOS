//
//  RelayAllReadyViewController.swift
//  Relay
//
//  Created by 이창형 on 2022/11/03.
//

import UIKit

class RelayAllReadyViewController: UIViewController {
    
    private let backButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(systemName: "arrow.left")
        
        button.setImage(image: image!)
        button.tintColor = .black
        
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "릴레이에 오신 것을\n환영합니다!\n\n뛸 준비 되셨나요?"
        label.font = .boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        
        return label
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupLayout()
    }
    
    private func setupLayout() {
        [
            backButton,
            titleLabel
        ].forEach { view.addSubview($0) }
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(59.0)
            $0.leading.equalToSuperview().inset(18.0)
            $0.width.height.equalTo(26.0)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(backButton).offset(55.0)
            $0.leading.equalToSuperview().inset(40.0)
        }
    }
}
