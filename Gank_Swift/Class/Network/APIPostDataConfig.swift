//
//  APIPostDataConfig.swift
//  Gank_Swift
//
//  Created by Yuns on 2017/11/9.
//  Copyright © 2017年 ZXEVPOP. All rights reserved.
//

import Foundation

open class APIPostDataConfig: APIBaseConfig {
    
    // 参数
    public var postData: Data!
    public var dataName: String = ""
    public var fileName: String = ""
    public var mineType: String = ""
    // 初始化方法
    init(url: String, data: Data, dataname: String, filename: String, minetype: String) {
        super.init()
        path = url
        postData = data
        dataName = dataname
        fileName = filename
        mineType = minetype
    }
    
    // 配置POST参数
    public func APIData() -> Data {
        return postData
    }
    
    public func APIDataName() -> String {
        return dataName
    }
    
    public func APIFileName() -> String {
        return fileName
    }
    
    public func APIMineType() -> String {
        return mineType
    }
}
