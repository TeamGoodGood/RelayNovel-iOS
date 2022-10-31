//
//  AppleLogin.swift
//  Relay
//
//  Created by 이창형 on 2022/10/31.
//

import UIKit
import AuthenticationServices

class AppleLogin: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAppleLoginButton()
    }
    
    func addAppleLoginButton() {
        let button = ASAuthorizationAppleIDButton(authorizationButtonType: .signIn, authorizationButtonStyle: .black)
        button.addTarget(self, action: #selector(loginHandler), for: .touchUpInside)
        self.view.addSubview(button)
        button.center = self.view.center
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

extension AppleLogin : ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let user = credential.user
            print("아이디 \(user)")
            if let email = credential.email {
                print("📧 \(email)")
            }
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("error \(error)")
    }
}
