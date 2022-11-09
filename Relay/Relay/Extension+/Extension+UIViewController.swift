//
//  Extension+Keyboard.swift
//  Relay
//
//  Created by 이창형 on 2022/11/09.
//

import UIKit

extension UIViewController {
    // 키보드 내리기
    func hideKeyboardWhenTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dissmissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc
    func dissmissKeyboard() {
        view.endEditing(true)
    }
}
