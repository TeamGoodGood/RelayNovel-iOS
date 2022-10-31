//
//  RelayLoginViewController.swift
//  Relay
//
//  Created by 이창형 on 2022/10/27.
//

import UIKit
import SnapKit
import AuthenticationServices

class RelayLoginViewController: UIViewController {
    
    private let loginButtonImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        let myImage: UIImage = UIImage(named: "AppleLogo")!
        
        imageView.image = myImage
        return imageView
    }()

    private let subTitleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "소설 이어쓰기 커뮤니티"
        label.font = UIFont(name: "CWDangamAsac-Bold", size: 20.0)
        label.textColor = UIColor(named: "MainColor")
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "릴레이"
        label.font = UIFont(name: "CWDangamAsac-Bold", size: 57.0)
        label.textColor = UIColor(named: "MainColor")
        return label
    }()
    
    private let loginImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        let myImage: UIImage = UIImage(named: "Lilla")!
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = myImage
        return imageView
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "AppleLogo")
        button.backgroundColor = .black
        button.setTitle("Apple로 로그인", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.setImage(UIImage(named: "AppleLogo"), for: .normal)
        button.contentHorizontalAlignment = .center
        button.semanticContentAttribute = .forceLeftToRight //<- 중요
        button.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 170)
        button.addTarget(self, action: #selector(loginHandler), for: .touchUpInside)
        button.layer.cornerRadius = 16
        return button
    }()
    
    private let noLoginButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let noLoginLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString.init(string: "로그인 없이 둘러보기")

        // label에 밑줄 그을 수 있게 도와줌
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:NSRange.init(location: 0, length: attributedString.length));

        label.attributedText = attributedString
        label.sizeToFit()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .label
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    private func setupLayout() {
        [
            subTitleLabel,
            titleLabel,
            loginImageView,
            noLoginButton,
            loginButton
            
        ].forEach { view.addSubview($0) }
        
        noLoginButton.addSubview(noLoginLabel)
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(188.0)
            $0.leading.equalToSuperview().inset(53.0)
            $0.trailing.equalToSuperview().inset(140.0)
            $0.bottom.equalToSuperview().inset(632.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(202.0)
            $0.leading.equalToSuperview().inset(53.0)
            $0.trailing.equalToSuperview().inset(160.0)
            $0.bottom.equalToSuperview().inset(555.0)
        }
        loginImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(346.0)
            $0.leading.equalToSuperview().inset(55.0)
            $0.trailing.equalToSuperview().inset(55.0)
            $0.bottom.equalToSuperview().inset(288.0)
        }
        noLoginButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(737.0)
            $0.leading.equalToSuperview().inset(128.0)
            $0.trailing.equalToSuperview().inset(129.0)
            $0.bottom.equalToSuperview().inset(89.0)
        }
        loginButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(652.0)
            $0.leading.equalToSuperview().inset(25.0)
            $0.trailing.equalToSuperview().inset(26.0)
            $0.bottom.equalToSuperview().inset(134.0)
        }
    }

    @objc func loginHandler() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self as? ASAuthorizationControllerPresentationContextProviding
        controller.performRequests()
    }

}


extension RelayLoginViewController : ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let user = credential.user
            print("💁🏻‍♂️ \(user)")
            if let email = credential.email {
                print("📧 \(email)")
            }
        }
    }

    // 오류 처리
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("error \(error)")
    }
}

