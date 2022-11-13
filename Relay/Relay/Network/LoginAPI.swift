//
//  LoginAPI.swift
//  Relay
//
//  Created by 이채민 on 2022/11/10.
//

import Foundation
import RxSwift
import RxAlamofire
import Moya

enum LoginService {
    case ping
    case appleLogin(token: String)
    case logout(userId: String)
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
        case .logout(_):
            return "/logout/"
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
        case .logout:
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
        case let .logout(userId):
            return .requestJSONEncodable(userId)
        case .leave:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
//        case .leave:
//            return ["Content-type": "application/json", "Authorization": "JWT "+AccountManager.token!]
        default:
            return ["Content-type": "application/json"]
        }
    }
}

class LoginAPI {
//    private static var provider = MoyaProvider<LoginService>()
//    static func ping() -> Single<Response> {
//        return provider.rx.request(.ping)
//    }
//    static func appleLogin(token: String) -> Single<Response> {
//        return provider.rx.request(.appleLogin(token: ["token": token]))
//    }
//    static func logout(userId: String) -> Single<Response> {
//        return provider.rx.request(.logout(userId: userId))
//    }
//    static func leave() -> Single<Response> {
//        return provider.rx.request(.leave)
//    }
}


// 아래 코드가 왜 여기 있는지 묻지 말아주세요 ..

struct LoginResponse: Codable {
    let token: String
    let userId: String
}

class AppleLogin {
    
    func loginWithApple(token: String) async throws {
        let dto = try await self.loginWithApple(token: token)
        
        DispatchQueue.main.async {
            appState.user.accessToken = dto.token
            appState.user.userId = dto.user_id
        }
        userDefaultsRepository.set(String.self, key: .token, value: dto.token)
        userDefaultsRepository.set(String.self, key: .userId, value: dto.user_id)
    }
    
    func loginWithApple(token: String) async throws -> LoginResponseDto {
        return try await session
            .request(LoginAPI.appleLogin(token: token))
            .serializingDecodable(LoginResponse.self)
            .handlingError()
    }
    
    func logout(userId: String, fcmToken: String) async throws -> LogoutResponse {
        return try await session
            .request(LoginAPI.leave())
            .serializingDecodable(LogoutResponse.self)
            .handlingError()
    }
}
