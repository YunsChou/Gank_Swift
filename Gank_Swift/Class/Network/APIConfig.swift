//
//  APIConfig.swift
//  Gank_Swift
//
//  Created by Yuns on 2017/9/7.
//  Copyright © 2017年 ZXEVPOP. All rights reserved.
//

import UIKit

public enum RequestMethod {
    case get
    case post
}

open class APIConfig {
    public var method: RequestMethod = .get
    public var baseURL: String = ""
    public var url: String = ""
    public var params: [String : Any]?
    public var headers: [String : String]?
    // 上传数据用
    public var data: Data!
    public var dataName: String = ""
    public var fileName: String = ""
    public var mineType: String = ""
    
    // 初始化方法
    public init(url: String, params: [String : Any]?) {
        self.url = url
        self.params = params
    }
    
    //／ 在子类中重写该方法：配置请求方式
    open func configMethod() -> RequestMethod {
        return method
    }
    //／ 在子类中重写该方法：配置域名
    open func configBaseURL() -> String {
        return baseURL
    }
    //／ 在子类中重写该方法：配置路径
    open func configUrl() -> String {
        return url
    }
    //／ 在子类中重写该方法：配置参数
    open func configParams() -> [String: Any] {
        return params ?? [:]
    }
    /// 在子类中重写该方法：配置header
    open func configHeaders() -> [String : String] {
        return headers ?? [:]
    }
    
    // 上传数据用
    //／ 在子类中重写该方法：配置数据
    open func configData() -> Data {
        return data
    }
    //／ 在子类中重写该方法：配置数据名
    open func configDataName() -> String {
        return dataName
    }
    //／ 在子类中重写该方法：配置数据路径
    open func configFileName() -> String {
        return dataName
    }
    //／ 在子类中重写该方法：配置数据类型
    open func configMineType() -> String {
        return mineType
    }
}



