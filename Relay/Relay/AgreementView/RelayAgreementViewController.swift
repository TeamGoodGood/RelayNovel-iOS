//
//  RelayAgreementViewController.swift
//  Relay
//
//  Created by 이창형 on 2022/11/01.
//

import UIKit
import SnapKit

class RelayAgreementViewController: UIViewController {
    private let backButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(systemName: "arrow.left")?.imageWithColor(color: .black)
        
        button.setImage(imageName: image!)
        
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "서비스 이용 동의"
        label.font = .boldSystemFont(ofSize: 24)
        
        return label
    }()
    
    private let allAgreeButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(systemName: "checkmark.circle.fill")?.imageWithColor(color: .gray)
        
        button.setTitle("전체 동의하기", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.titleEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 0)
        
        button.setImage(imageName: image!)
        
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    private func setupLayout() {
        [
            backButton,
            titleLabel,
            allAgreeButton
            
        ].forEach { view.addSubview($0) }
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(59.0)
            $0.leading.equalToSuperview().inset(18.0)
            $0.width.height.equalTo(26.0)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.bottom).offset(27.0)
            $0.leading.equalToSuperview().inset(21.0)
        }
        allAgreeButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.width.equalTo(125.0)
        }
//        makeButton(text: "만 14세 이상입니다").snp.makeConstraints {
//
//        }
    }
    
    func makeButton(text: String) -> (UIButton){
        let agreeButton: UIButton = {
            let button = UIButton(type: .custom)
            let image = UIImage(systemName: "checkmark.circle.fill")
            
            button.setTitle(text, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 16)
            
            button.contentHorizontalAlignment = .leading
            
            return button
        }()
        
        return agreeButton
    }
}
