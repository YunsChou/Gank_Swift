//
//  APIModel.swift
//  ZXCARMANAGER
//
//  Created by Yuns on 2018/3/8.
//  Copyright © 2018年 ZXEVPOP. All rights reserved.
//

import UIKit
import HandyJSON

class APIModel<T: HandyJSON>: HandyJSON {
    required init() { }
    var error: Bool = false

    var results: T?
}

class APIBlankModel: HandyJSON {
    required init() { }
}
