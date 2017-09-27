//
//  APIServer.swift
//  Gank_Swift
//
//  Created by Yuns on 2017/9/7.
//  Copyright © 2017年 ZXEVPOP. All rights reserved.
//

import UIKit
import Moya

public let APIServer = MoyaProvider<APIManager>()

public enum APIManager {
    case loadConfig(APIConfig)
    case postDataConfig(APIConfig)
}

extension APIManager: TargetType {
    public var baseURL: URL {
        switch self {
        case .loadConfig(let config):
            return URL(string: config.configBaseURL())!
        case .postDataConfig(let config):
            return URL(string: config.configBaseURL())!
        }
    }
    
    public var path: String {
        switch self {
        case .loadConfig(let config):
            return config.configUrl()
        case .postDataConfig(let config):
            return config.configUrl()
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .loadConfig(let config):
            switch config.configMethod() {
            case .get:
                return .get
            default:
                return .post
            }
        case .postDataConfig(_):
            return .post
        }
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    public var task: Task {
        switch self {
        case .loadConfig(let config):
            return .requestParameters(parameters: config.configParams(), encoding: URLEncoding.default)
        case .postDataConfig(let config):
            let formData = MultipartFormData(provider: .data(config.configData()), name: config.configDataName(), fileName: config.configFileName(), mimeType: config.configMineType())
            return .uploadMultipart([formData])
        }
    }
    
    public var headers: [String: String]? {
        switch self {
        case .loadConfig(let config):
            return config.configHeaders()
        case .postDataConfig(let config):
            return config.configHeaders()
        }
    }
}
