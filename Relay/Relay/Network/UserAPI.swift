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
    case updatePenname(user: UpdateUser)
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
        case .updatePenname(_):
            return "/"
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
        case .updatePenname:
            return .put
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
        case let .updatePenname(user):
            var pennameData = MultipartFormData(provider: .data(user.penname.data(using: .utf8)!), name: "penname")
            let multipartData = [pennameData]
            return .uploadMultipart(multipartData)
        case .getLiked:
            return .requestPlain
        case .getWrote:
            return .requestPlain
        case .getContributed:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self{
        case .updatePenname:
            return ["Content-type": "multipart/form-data"]
        default:
            return ["Content-type": "application/json"]
        }
    }
}

class UserAPI {
    
    static var authPlugin = AuthPlugin()
    static var provider = MoyaProvider<UserService>(plugins: [authPlugin])
    
    static func updatePenname(user: UpdateUser) -> Observable<ProgressResponse> {
            return provider.rx.requestWithProgress(.updatePenname(user: user))
    }
    
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
