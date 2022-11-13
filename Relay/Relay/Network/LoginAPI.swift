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
    case ping
    case appleLogin(token: String)
    case leave
}

extension LoginService: TargetType {
    
    var baseURL: URL {
        URL(string: APIConstants.BASE_URL)!
    }
    
    var path: String {
        switch self{
        case .ping:
            return "/ping/"
        case .appleLogin(_):
            return "/login/apple/"
        case .leave:
            return "/leave/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .ping:
            return .get
        case .appleLogin:
            return .post
        case .leave:
            return .delete
        }
    }
    
    var task: Task {
        switch self {
        case .ping:
            return .requestPlain
        case let .appleLogin(token):
            return .requestJSONEncodable(token)
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
    
    static func ping() -> Single<Response> {
        return provider.rx.request(.ping)
    }
    static func appleLogin(token: String) -> Single<Response> {
        return provider.rx.request(.appleLogin(token: token))
    }
    static func leave() -> Single<Response> {
        return provider.rx.request(.leave)
    }
}
