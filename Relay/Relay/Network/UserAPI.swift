//
//  UserAPI.swift
//  Relay
//
//  Created by 이채민 on 2022/11/10.
//

import Foundation
import RxSwift
import RxAlamofire
import Moya

enum UserService {
    case getLiked
    case getWrote
    case getContributed
}

extension UserService: TargetType {
    
    var baseURL: URL {
        URL(string: APIConstants.BASE_URL+"/user")!
    }
    
    var path: String {
        switch self {
        case .getLiked:
            return "/liked/"
        case .getWrote:
            return "/wrote/"
        case .getContributed:
            return "/contributed/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getLiked:
            return .get
        case .getWrote:
            return .get
        case .getContributed:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getLiked:
            return .requestPlain
        case .getWrote:
            return .requestPlain
        case .getContributed:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

class UserAPI {
    
    static var authPlugin = AuthPlugin()
    static var provider = MoyaProvider<UserService>(plugins: [authPlugin])
    
    static func getLiked() -> Single<Response> {
        return provider.rx.request(.getLiked)
    }
    static func getWrote() -> Single<Response> {
        return provider.rx.request(.getWrote)
    }
    static func getContributed() -> Single<Response> {
        return provider.rx.request(.getContributed)
    }
}
