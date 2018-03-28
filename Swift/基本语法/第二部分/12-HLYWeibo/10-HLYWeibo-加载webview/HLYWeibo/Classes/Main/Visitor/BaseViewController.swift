//
//  BaseViewController.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/3/9.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {

    //MARK:- 懒加载属性
    lazy var visitorView :VisitorView = VisitorView.visitorView()
    
    //MARK:- 定义变量
    var isLogin:Bool = false
    override func loadView() {
        isLogin ? super.loadView() :setupVisitorView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavItem()
        
    }
}

extension BaseViewController{
    // 访客视图
    private func setupVisitorView()  {
        
        self.view = visitorView
        // 事件监听
        visitorView.loginBtn.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
        visitorView.registerBtn.addTarget(self, action: #selector(registerBtnClick), for: .touchUpInside)
    }
    
    // 设置导航栏按钮
    func setupNavItem()  {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "注册", style: .plain, target: self, action: #selector(navLeftItemClick))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "登录", style: .plain, target: self, action: #selector(navRightItemClick))
    }
}

//MARK:- 事件监听
extension BaseViewController{
    @objc func navLeftItemClick()  {
        print("导航栏 - 左")
    }
    
    @objc func navRightItemClick()  {
        print("导航栏 - 右")
        loginBtnClick()
    }
    
    @objc func loginBtnClick()  {
        print("登录")
        let oauth = OAuthViewController()
        //包装一个导航控制器
        let oauthNav  = UINavigationController.init(rootViewController: oauth)
        present(oauthNav, animated: true, completion: nil)
        
    }
    
    @objc func registerBtnClick()  {
        print("注册")
    }
}
