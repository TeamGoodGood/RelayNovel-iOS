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
        
        label.text = "필명은 설정 후 수정 불가합니다."
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12)
        label.tintColor = .systemGray5
        
        return label
    }()
    
    private let penNameTextField: UITextField = {
        let textField = UITextField()
        
        textField.layer.cornerRadius = 8.0
        textField.clearButtonMode = .whileEditing
        textField.backgroundColor = .systemGray3
        textField.placeholder = "필명을 입력해주세요."
        
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        textField.addTarget(self, action: #selector(checkText), for: .editingChanged)
        
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.systemGray3, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        
        button.backgroundColor = .systemGray5
        
        button.layer.cornerRadius = 8
        button.isEnabled = false
        
        return button
    }()
    
    private lazy var textCountLabel: UILabel = {
        let label = UILabel()
        
        label.text = "0/10자"
        label.font = .systemFont(ofSize: 13)
        
        return label
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        self.addKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.removeKeyboardNotifications()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: UITextField.textDidChangeNotification, object: nil)
    }
}

extension RelayPenNameViewController {
    private func setupLayout() {
        [
            backButton,
            titleLabel,
            subTitleLabel,
            penNameTextField,
            submitButton,
            textCountLabel
        ].forEach { view.addSubview($0) }
        penNameTextField.delegate = self
        
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
        textCountLabel.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(16.0)
            $0.trailing.equalToSuperview().inset(19.0)
        }
        penNameTextField.snp.makeConstraints {
            $0.top.equalTo(textCountLabel.snp.bottom).offset(8.0)
            $0.leading.equalToSuperview().inset(21.0)
            $0.width.equalTo(350.0)
            $0.height.equalTo(41.0)
        }
        submitButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(34.44)
            $0.height.equalTo(52.56)
            $0.leading.equalToSuperview().inset(15.0)
            $0.trailing.equalToSuperview().inset(15.0)
        }
    }
    
    func addKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메소드 추가
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification , object: nil)
    }
    
    // 키보드가 나타났다는 알림을 받으면 실행할 메소드
    @objc func keyboardWillShow(_ noti: NSNotification){
        if let keyboardFrame: NSValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            submitButton.snp.makeConstraints {
                $0.bottom.equalToSuperview().inset(34.44 + keyboardHeight)
                $0.height.equalTo(52.56)
                $0.leading.equalToSuperview().inset(15.0)
                $0.trailing.equalToSuperview().inset(15.0)
            }
        }
    }

    // 노티피케이션을 제거하는 메소드
    func removeKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메소드 제거
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification , object: nil)
    }
    
    // 마지막 글자 한글 받침 사용하기 위해
    @objc
    func textDidChange(noti: NSNotification) {
            if let text = penNameTextField.text {
                if text.count >= 10 {
                    let fixedText = text.prefix(10)
                    penNameTextField.text = fixedText + " "
                    
                    let when = DispatchTime.now() + 0.01
                    DispatchQueue.main.asyncAfter(deadline: when) {
                        self.penNameTextField.text = String(fixedText)
                    }
                }
            }
        }
    
    @objc
    func checkText() {
        if penNameTextField.text!.count > 0 {
            submitButton.backgroundColor = .black
            submitButton.setTitleColor(.white, for: .normal)
            submitButton.isEnabled = true
        } else {
            submitButton.backgroundColor = .systemGray5
            submitButton.setTitleColor(.systemGray3, for: .normal)
            submitButton.isEnabled = false
        }
        
    }
    // 텍스트 숫자 세기
    @objc func textFieldDidChange(_ textField: UITextField) {
        let string = textField.text
        let strCount = string?.count
        
        if strCount ?? 0 > 10 {
            textCountLabel.text = "10/10자"
        } else {
            textCountLabel.text = "\(String(describing: strCount ?? 0))/10자"
        }
    }
}

extension RelayPenNameViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 백 스페이스 가능하게 설정
        if let char = string.cString(using: String.Encoding.utf8) {
                    let isBackSpace = strcmp(char, "\\b")
                    if isBackSpace == -92 {
                        return true
                    }
                }

                guard let text = textField.text else { return false }
                if text.count >= 11 {
                    return false
                }
                return true
    }
}

