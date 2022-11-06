//
//  RelayWritingViewController.swift
//  Relay
//
//  Created by 이창형 on 2022/11/05.
//

import UIKit

class RelayWritingViewController: UIViewController {
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .custom)
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "xmark", withConfiguration: config)
        
        button.setImage(image: image!)
        button.tintColor = .relayBlack
        
        return button
    }()
    
    private let completeButton: UIButton = {
        let button = UIButton()
     
        button.setTitle("완료", for: .normal)
        button.setTitleColor(.relayBlack, for: .normal)
        button.titleLabel?.setFont(.caption1)
        
        return button
    }()
    
    private let musicListButton: UIButton = {
        let button = UIButton(type: .custom)
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "music.note.list", withConfiguration: config)
        
        button.setImage(image: image!)
        button.tintColor = .relayPink1
        
        button.setTitle("플레이리스트 선택", for: .normal)
        button.titleLabel!.setFont(.body2)
        button.setTitleColor(.relayBlack, for: .normal)
        
        button.backgroundColor = .relayGray2
        button.layer.cornerRadius = 8
        
        button.contentHorizontalAlignment = .leading
        button.semanticContentAttribute = .forceLeftToRight
        button.imageEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 0)
        button.titleEdgeInsets = .init(top: 0, left: 28, bottom: 0, right: 0)
        
        return button
    }()
    
    private let muteButton: UIButton = {
        let button = UIButton(type: .custom)
        let config = UIImage.SymbolConfiguration(pointSize: 22)
        let image = UIImage(systemName: "speaker.slash.fill")
        
        button.setImage(image: image!)
        button.tintColor = .relayBlack
        
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "제목"
        label.setFont(.body1)
        
        return label
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        
        textField.layer.cornerRadius = 8.0
        textField.backgroundColor = .relayGray2
        textField.placeholder = "제목을 작성해주세요"
        
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        // TODO: 다음 스프린트때 제목 확인
//        textField.addTarget(self, action: #selector(checkText), for: .editingChanged)
        
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 0.0))
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private let titleTextCountLabel: UILabel = {
        let label = UILabel()
    
        label.text = "0/20자"
        label.setFont(.caption2)
    
        return label
    }()

    private let writeScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(writeScrollView)
//        writeScrollView.addSubview(contentView)
        setupLayout()
    }
    
    // 텍스트 숫자 세기
    @objc func textFieldDidChange(_ textField: UITextField) {
        let string = textField.text
        let strCount = string?.count
        
        if strCount ?? 0 > 20 {
            titleTextCountLabel.text = "0/20자"
        } else {
            titleTextCountLabel.text = "\(String(describing: strCount ?? 0))/20자"
        }
    }
    
    // 마지막 글자 한글 받침 사용하기 위해
    @objc
    func textDidChange(noti: NSNotification) {
            if let text = titleTextField.text {
                if text.count >= 20 {
                    let fixedText = text.prefix(20)
                    titleTextField.text = fixedText + " "
                    
                    let when = DispatchTime.now() + 0.01
                    DispatchQueue.main.asyncAfter(deadline: when) {
                        self.titleTextField.text = String(fixedText)
                    }
                }
            }
        }
}

extension RelayWritingViewController {
    private func setupLayout() {
        [
            closeButton,
            completeButton,
            muteButton,
            musicListButton,
            titleLabel,
            titleTextField,
            titleTextCountLabel
        ].forEach { writeScrollView.addSubview($0) }
        
        writeScrollView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(64.0)
            $0.leading.equalToSuperview().inset(20.0)
        }
        completeButton.snp.makeConstraints {
            $0.top.equalTo(closeButton.snp.top)
            $0.trailing.equalTo(view.snp.trailing).inset(20.0)
        }
        muteButton.snp.makeConstraints {
            $0.top.equalTo(closeButton.snp.bottom).offset(39.0)
            $0.trailing.equalTo(view.snp.trailing).inset(20.0)
            $0.width.equalTo(22.0)
        }
        musicListButton.snp.makeConstraints {
            $0.top.equalTo(closeButton.snp.bottom).offset(28.0)
            $0.leading.equalToSuperview().inset(20.0)
            $0.trailing.equalTo(muteButton.snp.leading).inset(-20.0)
            $0.height.equalTo(47.0)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(musicListButton.snp.bottom).offset(28.0)
            $0.leading.equalTo(musicListButton.snp.leading)
        }
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8.0)
            $0.leading.equalTo(musicListButton.snp.leading)
            $0.trailing.equalTo(muteButton.snp.trailing)
            $0.height.equalTo(49.0)
        }
        titleTextCountLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel)
            $0.trailing.equalTo(muteButton.snp.trailing)
        }
        
    }
}