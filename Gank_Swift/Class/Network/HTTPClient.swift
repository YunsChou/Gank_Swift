//
//  HTTPClient.swift
//  ZXCARMANAGER
//
//  Created by Yuns on 2018/3/8.
//  Copyright © 2018年 ZXEVPOP. All rights reserved.
//

import Foundation
import HandyJSON
import Moya
import RxSwift
import SVProgressHUD

#if DEBUG
let kBaseURLString = "http://gank.io"
#else
let kBaseURLString = "http://gank.io"
#endif

extension Array: HandyJSON {}

// MARK: - 普通GET/POST请求
extension HandyJSON {
    static func request(baseURLString: String = kBaseURLString, method: APIRequestMethod, url: String, dict: [String : Any]?, encodingType: APIEncodingType = .URL) -> Single<APIModel<Self>> {
        let config = APIConfig.init(baseURLString: baseURLString, method: method, encodingType: encodingType, path: url, params: dict)
        return APIServer.rx.request(.loadConfig(config))
            .filterSuccessfulStatusCodes()
            .mapData(APIModel<Self>.self)
            .do(onSuccess: { (model) in
                print(model.error)
            }, onError: { (error) in
                print("error:" + error.localizedDescription)
            })
    }
}

// MARK: - 上传文件请求
extension HandyJSON {
    static func upload(baseURLString: String = kBaseURLString, url: String, dict: [String : Any]?, datas: [APIUploadData]? = nil, files: [APIUploadFile]? = nil) -> Single<APIModel<Self>> {
        let config = APIUploadConfig.init(baseURLString: kBaseURLString, path: url, params: dict)
        config.datas = datas
        config.files = files
        return APIServer.rx.request(.uploadConfig(config))
            .filterSuccessfulStatusCodes()
            .mapData(APIModel<Self>.self)
            .do(onSuccess: { (model) in
                print(model.error)
            }, onError: { (error) in
                print("error:" + error.localizedDescription)
            })
    }

}

// MARK: - headers
extension HandyJSON {
    
}

// MARK: - 错误处理
extension HandyJSON {
    // 接口请求成功，处理报错
    static func dealWithSuccError(model: APIModel<Self>) {
        // 获取数据失败
        if !model.error {
            // 失败状态码
                // 失败信息
                SVProgressHUD.showError(withStatus: "请求出错")
        }
    }
    
    // 接口请求失败，处理报错
    static func dealWithFailError(_ error: Error? = nil) {
        if let e = error as? MoyaError {
            // 请求接口失败
            SVProgressHUD.showError(withStatus: e.errorMessage())
        }
    }
}

extension MoyaError {
    func errorMessage() -> String {
        switch self {
        case .imageMapping, .jsonMapping, .stringMapping:
            return "数据解析出错"
        case .statusCode(let response):
            return "状态码无效\n状态码：\(response.statusCode)"
        case .requestMapping:
            return "端点映射失败"
        case .underlying(_, _):
            return "请求失败，请检查网络"
        default: return "请求失败，请检查网络"
        }
    }
}
