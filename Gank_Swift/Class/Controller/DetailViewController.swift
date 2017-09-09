//
//  DetailViewController.swift
//  Gank_Swift
//
//  Created by Yuns on 2017/9/7.
//  Copyright © 2017年 ZXEVPOP. All rights reserved.
//

import UIKit
import Then
import EZSwiftExtensions

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        configUI()
        
        do {
            print("Then中do、then、with的使用")
        }
    }
    
    func configUI() {
        // Then的用法
        let view1 = UIView().then { (view) in
            view.backgroundColor = UIColor.red
            view.frame = CGRect(x: 10, y: 80, width: 100, height: 100)
        }
        view.addSubview(view1)
        
        let view2 = UIView().then({
            $0.backgroundColor = UIColor.yellow
            $0.frame = CGRect().with({
                // EZSwiftExtensions中的扩展
                $0.x = 150
                $0.y = 80
                $0.size = CGSize(width: 100, height: 100)
            })
        })
        view.addSubview(view2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
