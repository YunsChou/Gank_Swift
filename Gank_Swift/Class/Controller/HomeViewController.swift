//
//  HomeViewController.swift
//  Gank_Swift
//
//  Created by Yuns on 2017/9/7.
//  Copyright © 2017年 ZXEVPOP. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit
import NSObject_Rx

class HomeViewController: UIViewController {

    typealias T = UITableView
    var homeDatas: [HomeModel]?
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
//        loadNormalData()
        loadHandyJSONData()

        
    }
    
    /// rx+moya扩展HandyJSON，请求数据
    func loadHandyJSONData() {
        HomeModel.loadResults(url: "/api/data/iOS/10/1", dict: nil)
            .subscribe(onSuccess: { (results) in
                // 刷新列表
                self.homeDatas = results
                self.tableView.reloadData()
            })
            .addDisposableTo(rx.disposeBag)
    }
    
    
    // MARK: - lazy load
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 80
        tableView.tableFooterView = UIView()
        
        tableView.register(UINib(nibName:"HomeTableViewCell", bundle:nil),forCellReuseIdentifier:"HomeTableViewCell")
        return tableView
    }()
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension HomeViewController {
    func configUI() {
        setupSubviews()
        snapSubviews()
    }
    
    func setupSubviews() {
        view.addSubview(tableView)
    }
    
    func snapSubviews() {
        // snpkit的简单使用
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    
    /// rx+moya普通方式请求数据
    func loadNormalData() {
        let config = APIGetConfig.init(url: "/api/data/iOS/10/1", dict: nil)
        APIServer.rx.request(.loadDataConfig(config))
            .filterSuccessfulStatusCodes()
            .mapString()
            .subscribe(onSuccess: { (data) in
                // 数据转模型
                let model = GankModel<HomeModel>.deserialize(from: data)
                // 刷新列表
                self.homeDatas = model?.results
                self.tableView.reloadData()
            }, onError: { (error) in
                print(error)
            })
            // NSObject_Rx的使用，避免每次都要创建disposeBag对象
            .addDisposableTo(rx.disposeBag)
    }

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homeDatas?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell")
            as! HomeTableViewCell

        let homeData = self.homeDatas?[indexPath.row]
        cell.config(data: homeData!)
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

