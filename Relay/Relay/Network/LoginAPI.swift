//
//  LoginAPI.swift
//  Relay
//
//  Created by 이채민 on 2022/11/10.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire
import Moya

enum LoginService {
    case signup(user: UserRequest)
    case appleLogin(access_token: String, code: String, id_token: String)
    case leave
}

extension LoginService: TargetType {
    
    var baseURL: URL {
        URL(string: APIConstants.BASE_URL)!
    }
    
    var path: String {
        switch self{
        case .signup(_):
            return "/signup/"
        case .appleLogin:
            return "/login/apple/"
        case .leave:
            return "/leave/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signup:
            return .post
        case .appleLogin:
            return .post
        case .leave:
            return .delete
        }
    }
    
    var task: Task {
        switch self {
        case let .signup(user):
            return .requestJSONEncodable(["password": user.token, "email": user.email, "username": user.username])
        case let .appleLogin(access_token, code, id_token):
            return .requestJSONEncodable(["access_token": access_token, "code": code, "id_token": id_token])
        case .leave:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .leave:
            return ["Content-type": "application/json", "Authorization": "JWT "+AccountManager.token!]
        default:
            return ["Content-type": "application/json"]
        }
    }
}

class LoginAPI {
    
    static var provider = MoyaProvider<LoginService>()
    static func signup(user: UserRequest) -> Single<Response> {
        return provider.rx.request(.signup(user: user))
    }
    static func appleLogin(access_token: String, code: String, id_token: String) -> Single<Response> {
        return provider.rx.request(.appleLogin(access_token: access_token, code: code, id_token: id_token))
    }
    static func leave() -> Single<Response> {
        return provider.rx.request(.leave)
    }
}
