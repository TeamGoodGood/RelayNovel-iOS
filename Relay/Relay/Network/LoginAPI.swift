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
    case appleLogin(token: String)
    case signUp(phone_number: String, username: String)
    case authenticate(phone_number: String)
    case completeAuth(phone_number: String, auth_number: String)
    case logout
    case leave
}

extension LoginService: TargetType {
    
    var baseURL: URL {
        URL(string: APIConstants.BASE_URL)!
    }
    
    var path: String {
        switch self{
        case .appleLogin(_):
            return "/login/apple/"
        case .signUp(_,_):
            return "/signup/"
        case .authenticate(_):
            return "/authenticate/"
        case .completeAuth(_, _):
            return "/authenticate/"
        case .logout:
            return "/logout/"
        case .leave:
            return "/leave/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .appleLogin:
            return .post
        case .signUp:
            return .post
        case .authenticate:
            return .post
        case .completeAuth:
            return .put
        case .logout:
            return .put
        case .leave:
            return .delete
        }
    }
    
    var task: Task {
        switch self {
        case let .appleLogin(token):
            return .requestJSONEncodable(token)
        case let .signUp(phone_number, username):
            var dict: [String: String] = [:]
            dict["phone_number"] = "\(phone_number)"
            dict["username"] = "\(username)"
            return .requestParameters(parameters: dict, encoding: URLEncoding.queryString)
        case let .authenticate(phone_number):
            return .requestJSONEncodable(["phone_number": phone_number])
        case let .completeAuth(phoneNumber, authNumber):
            return .requestJSONEncodable(["phone_number": phoneNumber, "auth_number": authNumber])
        case .logout:
            return .requestPlain
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
    
    static func appleLogin(token: String) -> Single<Response> {
        return provider.rx.request(.appleLogin(token: token))
    }
    
    static func signUp(phone_number: String, username: String) -> Single<Response> {
        return provider.rx.request(.signUp(phone_number: phone_number, username: username))
    }
    
    static func authenticate(phone_number: String) -> Single<Response> {
        return provider.rx.request(.authenticate(phone_number: phone_number))
    }
    
    static func completeAuth(phone_number: String, auth_number: String) -> Single<Response> {
        return provider.rx.request(.completeAuth(phone_number: phone_number, auth_number: auth_number))
    }
    
    static func logout() -> Single<Response> {
        return provider.rx.request(.logout)
    }
    
    static func leave() -> Single<Response> {
        return provider.rx.request(.leave)
    }
}
