//
//  SelfLoginVIewController.swift
//  Relay
//
//  Created by 이창형 on 2023/01/13.
//

import UIKit
import SnapKit

class RelaySelfLoginViewController: UIViewController {
    private let backButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(systemName: "arrow.left")
        
        button.setImage(image: image!)
        button.tintColor = .black
        button.addTarget(self, action: #selector(dissmissViewController), for: .touchUpInside)
        
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "로그인에 사용할\n이메일을 입력해주세요"
        label.numberOfLines = 0
        label.setFont(.display1)

        return label
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        
        textField.layer.cornerRadius = 8.0
        textField.backgroundColor = .relayGray2
        textField.placeholder = "relay@relay.com"
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0))
        textField.leftViewMode = .always
        
        textField.addTarget(self, action: #selector(titleTextFieldDidChange), for: .editingChanged)
        
        return textField
    }()
    
    private let selfLoginButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .relayGray
        button.setTitle("다음", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        button.layer.cornerRadius = 8
        button.isEnabled = false
        
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        addKeyboardNotifications()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    @objc
    func dissmissViewController() {
        self.presentingViewController?.dismiss(animated: true, completion:nil)
    }
    
    @objc
    func titleTextFieldDidChange(_ textField: UITextField) {
        let string = textField.text
        let strCount = string?.count
        
        if strCount ?? 0 > 0 {
            selfLoginButton.backgroundColor = .relayBlack
            selfLoginButton.isEnabled = true
        } else {
            selfLoginButton.backgroundColor = . relayGray
            selfLoginButton.isEnabled = false
        }
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
         backButton,
         titleLabel,
         titleTextField,
         selfLoginButton
        ].forEach { view.addSubview($0) }
        
        backButton.snp.makeConstraints{
            $0.top.equalToSuperview().inset(60.0)
            $0.leading.equalToSuperview().inset(20.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(136.0)
            $0.leading.equalToSuperview().inset(20.0)
            
        }
        titleTextField.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.top.equalTo(titleLabel.snp.bottom).offset(30.0)
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
