//
//  GankModel.swift
//  Gank_Swift
//
//  Created by Yuns on 2017/9/7.
//  Copyright © 2017年 ZXEVPOP. All rights reserved.
//

import UIKit
import HandyJSON

class GankModel<T>: HandyJSON {
    required init() { }
    
    var error: Bool = false
    var results: [T]?
}

