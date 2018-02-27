//
//  ViewController.swift
//  10-tableview简单的使用
//
//  Created by tzsoft on 2018/2/26.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK:- 懒加载的属性
    /// tableview的属性
    lazy var tableView:UITableView = UITableView()
    
    //MARK:- 系统回调方法
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
}

extension ViewController{
    func setupUI() {
        //
        view.addSubview(tableView)
        
        //1、设置frame
        tableView.frame = view.bounds
        
        //2、设置数据源
        tableView.dataSource = self
        
        //3、设置代理
        tableView.delegate = self
    }
}

// extension类似于OC的category，也是这能扩充方法不能扩充属性
extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    //dataSource两个代理方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // UITableViewDelegate的代理方法
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "CELLID"
        //1、创建cell
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if(cell == nil){
            cell = UITableViewCell(style:.subtitle, reuseIdentifier: cellID)
        }
        //2、给cell设置数据
        cell?.textLabel?.text = "测试数据\(indexPath.row)"
        //3、返回cell
        return cell!// 解包
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
}
