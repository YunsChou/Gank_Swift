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
    case loadDataConfig(APIGetConfig)
    case postDataConfig(APIPostConfig)
}

extension APIManager: TargetType {
    public var baseURL: URL {
        switch self {
        case .loadDataConfig(let config):
            return URL(string: config.APIBaseURL())!
        case .postDataConfig(let config):
            return URL(string: config.APIBaseURL())!
        }
    }
    
    public var path: String {
        switch self {
        case .loadDataConfig(let config):
            return config.APIPath()
        case .postDataConfig(let config):
            return config.APIPath()
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .loadDataConfig(let config):
            switch config.APIMethod() {
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
        case .loadDataConfig(let config):
            return .requestParameters(parameters: config.APIParams(), encoding: URLEncoding.default)
        case .postDataConfig(let config):
            let formData = MultipartFormData(provider: .data(config.APIData()), name: config.APIDataName(), fileName: config.APIFileName(), mimeType: config.APIMineType())
            return .uploadMultipart([formData])
        }
    }
    
    public var headers: [String: String]? {
        switch self {
        case .loadDataConfig(let config):
            return config.APIHeaders()
        case .postDataConfig(let config):
            return config.APIHeaders()
        }
    }
}
