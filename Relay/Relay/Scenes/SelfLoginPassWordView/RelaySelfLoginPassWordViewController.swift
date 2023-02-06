//
//  RelaySelfLoginEmailViewController.swift
//  Relay
//
//  Created by 이창형 on 2023/01/18.
//

import UIKit
import SnapKit

class RelaySelfLoginPassWordViewController: UIViewController {

    private let backbutton = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .done, target: self, action: #selector(back))
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "로그인에 사용할\n이메일을 입력해주세요"
        label.numberOfLines = 0
        label.setFont(.display1)
        
        return label
    }()
    
    private let passWordTextField: UITextField = {
        let textField = UITextField()
        
        textField.layer.cornerRadius = 8.0
        textField.backgroundColor = .relayGray2
        textField.placeholder = "문자+숫자/20자 이내"
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0))
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private let checkTextField: UITextField = {
        let textField = UITextField()
        
        textField.layer.cornerRadius = 8.0
        textField.backgroundColor = .relayGray2
        textField.placeholder = "문자+숫자/20자 이내"
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0))
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private let selfLoginButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .relayGray
        button.setTitle("가입완료", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        button.layer.cornerRadius = 8
        button.isEnabled = false
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        backbutton.tintColor = .relayBlack
        self.navigationItem.leftBarButtonItem = backbutton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addKeyboardNotifications()
    }

    @objc func back() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.popViewController(animated: true)
       }
    
    @objc func keyboardWillShow(_ noti: NSNotification){
        if let keyboardFrame: NSValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            selfLoginButton.snp.makeConstraints {
                $0.height.equalTo(56.0)
                $0.bottom.equalToSuperview().inset(20.0 + keyboardHeight)
                $0.leading.equalToSuperview().inset(26.0)
                $0.trailing.equalToSuperview().inset(26.0)
            }
        }
    }
    
    func addKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메소드 추가
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification , object: nil)
    }
    
    private func setupLayout() {
        [
            titleLabel,
            passWordTextField,
            checkTextField,
            selfLoginButton
        ].forEach { view.addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(136.0)
            $0.leading.equalToSuperview().inset(20.0)
        }
        passWordTextField.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.top.equalTo(titleLabel.snp.bottom).offset(30.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
        checkTextField.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.top.equalTo(passWordTextField.snp.bottom).offset(20.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalToSuperview().inset(20.0)
        }
        selfLoginButton.snp.makeConstraints {
            $0.height.equalTo(56.0)
            $0.bottom.equalToSuperview().inset(20.0)
            $0.leading.equalToSuperview().inset(26.0)
            $0.trailing.equalToSuperview().inset(26.0)
        }
        
        
    }
}
