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
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: config)
        
        button.setTitle("전체 동의하기", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.titleEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 0)
        
        button.setImage(image, for: .normal)
        
        button.tintColor = .systemGray5
        
        button.addTarget(self, action: #selector(allAgreeCheck(sender:)), for: .touchUpInside)
        
        button.contentHorizontalAlignment = .leading
        
        return button
    }()
    
    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        
        return view
    }()
    
    // 정해진 약관이 없어서 이름 이렇게 해놨습니다
    private lazy var firstAgreeButton: UIButton = {
        let btn = makeButton(text: "만 14세 이상입니다.")
        
        return btn
    }()
    
    private lazy var secondAgreeButton: UIButton = {
        let btn = makeButton(text: "(필수) 서비스 이용약관")
        
        return btn
    }()
    
    private lazy var thirdAgreeButton: UIButton = {
        let btn = makeButton(text: "(필수) 개인정보 처리방침")
        
        return btn
    }()
    
    private lazy var forthAgreeButton: UIButton = {
        let btn = makeButton(text: "(선택) 마케팅 정보 수신동의")
        
        return btn
    }()
    
    private lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.isHidden = true
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
            allAgreeButton,
            divider,
            firstAgreeButton,
            secondAgreeButton,
            thirdAgreeButton,
            forthAgreeButton,
            submitButton
            
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
            $0.width.equalTo(250.0)
        }
        divider.snp.makeConstraints {
            $0.top.equalTo(allAgreeButton.snp.bottom).offset(25.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.height.equalTo(1.0)
        }
        firstAgreeButton.snp.makeConstraints {
            $0.top.equalTo(allAgreeButton.snp.bottom).offset(49.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.width.equalTo(250.0)
        }
        secondAgreeButton.snp.makeConstraints {
            $0.top.equalTo(firstAgreeButton.snp.bottom).offset(31.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.width.equalTo(250.0)
        }
        thirdAgreeButton.snp.makeConstraints {
            $0.top.equalTo(secondAgreeButton.snp.bottom).offset(31.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.width.equalTo(250.0)
        }
        forthAgreeButton.snp.makeConstraints {
            $0.top.equalTo(thirdAgreeButton.snp.bottom).offset(31.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.width.equalTo(250.0)
        }
        submitButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func makeButton(text: String) -> (UIButton){
        let agreeButton: UIButton = {
            let button = UIButton(type: .custom)
            let config = UIImage.SymbolConfiguration(pointSize: 22)
            let image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: config)
            
            button.setTitle(text, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 16)
            button.setTitleColor(.black, for: .normal)
            button.titleEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 0)

            button.setImage(image, for: .normal)
            button.tintColor = .systemGray5
            
            button.contentHorizontalAlignment = .leading
            
            button.addTarget(self, action: #selector(agreeCheck(sender:)), for: .touchUpInside)
            
            return button
        }()
        
        return agreeButton
    }
    
    @objc
    func agreeCheck(sender: UIButton) {
        print(sender.currentImage)
        if sender.tintColor == .systemGray5 {
            sender.tintColor = UIColor(named: "MainColor")
        }
        else {
            sender.tintColor = .systemGray5
        }
        checkNextStep()
    }
    
    @objc
    func allAgreeCheck(sender: UIButton) {
        if sender.tintColor == .systemGray5 {
            sender.tintColor = UIColor(named: "MainColor")
            firstAgreeButton.tintColor = UIColor(named: "MainColor")
            secondAgreeButton.tintColor = UIColor(named: "MainColor")
            thirdAgreeButton.tintColor = UIColor(named: "MainColor")
            forthAgreeButton.tintColor = UIColor(named: "MainColor")
            submitButton.isHidden = false
        }
        else {
            sender.tintColor = .systemGray5
            firstAgreeButton.tintColor = .systemGray5
            secondAgreeButton.tintColor = .systemGray5
            thirdAgreeButton.tintColor = .systemGray5
            forthAgreeButton.tintColor = .systemGray5
            submitButton.isHidden = true
        }
    }
    
    func checkNextStep() {
        let checkColor = UIColor(named: "MainColor")
        
        if firstAgreeButton.tintColor == checkColor && secondAgreeButton.tintColor == checkColor && thirdAgreeButton.tintColor == checkColor {
            submitButton.isHidden = false
        } else {
            submitButton.isHidden = true
        }
    }
}
