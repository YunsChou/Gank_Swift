//
//  APIUploadConfig.swift
//  ZXCARMANAGER
//
//  Created by Yuns on 2018/3/10.
//  Copyright © 2018年 ZXEVPOP. All rights reserved.
//

import Foundation

public struct APIUploadData {
    public var uploadData: Data!
    public var dataName: String = ""
    public var fileName: String = ""
    public var mineType: String = ""
}

public struct APIUploadFile {
    public var uploadFile: URL!
    public var dataName: String = ""
    public var fileName: String = ""
    public var mineType: String = ""
}

open class APIUploadConfig: APIConfig {
    public var datas: [APIUploadData]?
    public var files: [APIUploadFile]?
}
