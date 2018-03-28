//
//  OAuthViewController.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/3/28.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit

class OAuthViewController: UIViewController {
    //MARK:- 控件属性
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "登录页面"
        // 1 设置导航栏的内容
        setupNavBar()
        // 2 加载网页
        webView.loadRequest(URLRequest(url:NSURL(string: "http://www.baidu.com")! as URL))
        
    }

}
//MARK:- 设置UI界面相关/
extension OAuthViewController{
    // 设置导航栏的item
    func setupNavBar()  {
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "关闭", style: .plain, target: self, action: #selector(closeEvent))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "填充", style: .plain, target: self, action: #selector(fillinEvent))
    }
    
}

extension OAuthViewController{
    @objc func closeEvent(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func fillinEvent(){
        print("填充")
    }
}
