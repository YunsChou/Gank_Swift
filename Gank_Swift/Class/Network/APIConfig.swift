//
//  APIConfig.swift
//  Gank_Swift
//
//  Created by Yuns on 2017/9/7.
//  Copyright © 2017年 ZXEVPOP. All rights reserved.
//

import UIKit

enum RequestMethod {
    case get
    case post
}

class APIConfig {
    var type: RequestMethod = .get
    var domain: String = ""
    var path: String = ""
    var dict: [String : Any]?
    var header: [String : String]?
    
    // 初始化方法
    init(path: String, dict: [String : Any]?) {
        self.path = path
        self.dict = dict
    }
    
    
    //／ 在子类中重写该方法：配置请求方式
    func configMethod() -> RequestMethod {
        return type
    }
    //／ 在子类中重写该方法：配置域名
    func configBaseURL() -> String {
        return domain
    }
    //／ 在子类中重写该方法：配置路径
    func configUrl() -> String {
        return path
    }
    //／ 在子类中重写该方法：配置参数
    func configParams() -> [String: Any] {
        return dict ?? [:]
    }
    /// 在子类中重写该方法：配置header
    func configHeaders() -> [String : String] {
        return header ?? [:]
    }
}

/****************************************/
/***************提供网络请求配置************/
/****************************************/
protocol APIConfigType {
    var method: RequestMethod { get }
    var baseURL: String { get }
    var url: String { get }
    var params: [String : Any] { get }
    var headers: [String : String]? { get }
}

extension APIConfig: APIConfigType {
    
    var method: RequestMethod {
        return configMethod()
    }
    
    var baseURL: String {
        return configBaseURL()
    }
    
    var url: String {
        return configUrl()
    }
    
    var params: [String : Any] {
        return configParams()
    }
    
    var headers: [String : String]? {
        return configHeaders()
    }
}



