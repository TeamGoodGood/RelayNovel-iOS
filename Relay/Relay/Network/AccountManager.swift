//
//  AccountManager.swift
//  Relay
//
//  Created by 이채민 on 2022/11/14.
//

import Foundation
import UIKit
import RxSwift

class AccountManager {
    
    static var token: String?
    static var userId: String?
    
    static func saveTokenForAutoLogin(){
        
        let encoder = JSONEncoder()
        let encoded = try! encoder.encode(userId!)
        UserDefaults.standard.set(encoded, forKey: "userId")
        let keychainQuery: NSDictionary = [
            kSecClass : kSecClassGenericPassword,
            kSecAttrService: "com.GoodGood",
            kSecAttrAccount: "userToken",
            kSecValueData: token!.data(using: .utf8, allowLossyConversion: false)!
        ]
        SecItemDelete(keychainQuery)
        let status: OSStatus = SecItemAdd(keychainQuery, nil)
        assert(status == noErr, "failed to save jwt token: \(status)")
    }
    
    static func login(disposeBag: DisposeBag, _ data: LoginResponse, autologin: Bool = false) {
        
        token = data.token
        userId = data.userId
        if autologin {
            saveTokenForAutoLogin()
        }
    }
    
    // 로그아웃 시 -> AccountManager의 logout()만 호출, 탈퇴 -> LoginAPI의 leave랑 이거 동시 호출
    static func logout() {
        
        let keychainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: "com.GoodGood",
            kSecAttrAccount: "userToken"
        ]
        let status = SecItemDelete(keychainQuery)
        if status != errSecItemNotFound {
            assert(status == noErr, "failed to delete jwt token: \(status)")
        }
        UserDefaults.standard.removeObject(forKey: "userId")
    }
    
    static func tryAutologin(disposeBag: DisposeBag) -> Bool {
        
        let keychainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: "com.GoodGood",
            kSecAttrAccount: "userToken",
            kSecReturnData: kCFBooleanTrue!,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(keychainQuery, &dataTypeRef)
        
        if status == errSecSuccess {
            let retrievedData = dataTypeRef as! Data
            let value = String(data: retrievedData, encoding: .utf8)
            token = value
            if let savedValue = UserDefaults.standard.object(forKey: "userId") as? Data{
                let decoder = JSONDecoder()
                if let userId = try? decoder.decode(String.self, from: savedValue) {
                    self.userId = userId
                    print("autologin success")
                    return true
                }
            }
            print("autologin failure")
            return false
        } else {
            print("autologin failure")
            return false
        }
    }
}
