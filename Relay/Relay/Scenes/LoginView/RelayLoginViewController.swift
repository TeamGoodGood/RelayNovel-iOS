//
//  RelayLoginViewController.swift
//  Relay
//
//  Created by 이창형 on 2022/10/27.
//

import UIKit
import SnapKit
import AuthenticationServices
import RxSwift

class RelayLoginViewController: UIViewController {
    
    private let backButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(systemName: "arrow.left")
        
        button.setImage(image: image!)
        button.tintColor = .black
        
        return button
    }()
    
    private let loginButtonImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        let myImage: UIImage = UIImage(named: "AppleLogo")!
        
        imageView.image = myImage
        
        return imageView
    }()

    private let subTitleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "소설 이어쓰기 커뮤니티"
        //TODO: 디자인시스템 완성 후 extension 활용으로 리팩토링
        label.font = UIFont(name: "CWDangamAsac-Bold", size: 20.0)
        label.textColor = UIColor(named: "MainColor")
        
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "릴레이"
        //TODO: 디자인시스템 완성 후 extension 활용으로 리팩토링
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
        button.semanticContentAttribute = .forceLeftToRight
        button.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 170)
        
        button.layer.cornerRadius = 16
        
        button.addTarget(self, action: #selector(addLoginHandler), for: .touchUpInside)
        
        return button
    }()
    
    
    // button 액션 추가 예정
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
        Task {
            try await sendAuthAPI()
        }
    }
    
    private func sendAuthAPI() async {
        do {
            try await LoginAPI.authenticate(phone_number: "01022875783").subscribe {
                response in print(response)
            }
            try await LoginAPI.signUp(phone_number: "01022875783", username: "mbsoo")
            print("ddd")
        } catch {
            print("error")
        }
    }
    
    private func setupLayout() {
        [
            backButton,
            subTitleLabel,
            titleLabel,
            loginImageView,
            noLoginButton,
            loginButton
        ].forEach { view.addSubview($0) }
        
        noLoginButton.addSubview(noLoginLabel)
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(59.0)
            $0.leading.equalToSuperview().inset(18.0)
            $0.width.height.equalTo(26.0)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(188.0)
            $0.leading.equalToSuperview().inset(53.0)
            $0.height.equalTo(24.0)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom)
            $0.leading.equalToSuperview().inset(53.0)
            $0.height.equalTo(77.0)
        }
        loginImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(64.3)
            $0.leading.equalToSuperview().inset(55.0)
            $0.trailing.equalToSuperview().inset(55.0)
            $0.width.equalTo(167.0)
            $0.height.equalTo(179.99)
        }
        loginButton.snp.makeConstraints {
            $0.height.equalTo(56.0)
            $0.leading.equalToSuperview().inset(25.0)
            $0.trailing.equalToSuperview().inset(26.0)
            $0.top.equalTo(loginImageView.snp.bottom).offset(129.7)
           
        }
        noLoginButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(24.0)
            $0.leading.equalToSuperview().inset(128.0)
            $0.trailing.equalToSuperview().inset(129.0)
        }
}
    

    @objc func addLoginHandler() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self as? ASAuthorizationControllerPresentationContextProviding
        controller.performRequests()
    }

}


extension RelayLoginViewController : ASAuthorizationControllerDelegate {
    
    func authorizationController(controller _: ASAuthorizationController,
                                 didCompleteWithAuthorization authorization: ASAuthorization)
    {
        Task {
            await loginWithApple(successResult: authorization)
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("error \(error)")
    }

    private func loginWithApple(successResult: ASAuthorization) async {
        guard let credential = successResult.credential as? ASAuthorizationAppleIDCredential,
        let tokenData = credential.identityToken,
        let token = String(data: tokenData, encoding: .utf8)
        else {
            print("error")
            return
        }
        do {
            try await LoginAPI.appleLogin(token: token)
            let loginResponse = LoginResponse(token: token, userId: credential.user)
            AccountManager.login(disposeBag: DisposeBag(), loginResponse, autologin: true)
        } catch {
            print("error")
        }
    }
}
