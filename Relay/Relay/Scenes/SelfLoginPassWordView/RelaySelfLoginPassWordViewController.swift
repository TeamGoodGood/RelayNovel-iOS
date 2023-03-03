//
//  RelaySelfLoginEmailViewController.swift
//  Relay
//
//  Created by 이창형 on 2023/01/18.
//

import UIKit
import SnapKit

class RelaySelfLoginPassWordViewController: UIViewController {
    
    private lazy var backbutton = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .done, target: self, action: #selector(back))
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "로그인에 사용할\n비밀번호를 입력해주세요"
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
        textField.addTarget(self, action: #selector(TFdidChanged), for: .editingChanged)
        
        return textField
    }()
    
    private let checkTextField: UITextField = {
        let textField = UITextField()
        
        textField.layer.cornerRadius = 8.0
        textField.backgroundColor = .relayGray2
        textField.placeholder = "문자+숫자/20자 이내"
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0))
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(TFdidChanged), for: .editingChanged)
        
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
    
    @objc func TFdidChanged(_ sender: UITextField) {
        var pass = passWordTextField.text
        var pass2 = checkTextField.text
        
        //비밀번호가 일치하는 지 확인.
        if isSameBothTextField(passWordTextField, checkTextField) && isValidPassword(pwd: pass ?? "") && isValidPassword(pwd: pass2 ?? "")  {
            updateButton(willActive: true)
        }
        else {
            updateButton(willActive: false)
        }
    }
    
    func updateButton(willActive: Bool) {
        if(willActive == true) {
            selfLoginButton.backgroundColor = .relayBlack
            selfLoginButton.isEnabled = true
            
        } else {
            selfLoginButton.backgroundColor = .relayGray
            selfLoginButton.isEnabled = false
        }
    }
    
    
    func addKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메소드 추가
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification , object: nil)
    }
    
    func isSameBothTextField(_ first: UITextField,_ second: UITextField) -> Bool {
        if(first.text == second.text) {
            return true
        } else {
            return false
        }
    }
    
    // 비밀번호 형식 검사
        func isValidPassword(pwd: String) -> Bool {
            let passwordRegEx = "^[a-zA-Z0-9]{8,12}$"
            let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
            return passwordTest.evaluate(with: pwd)
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
