//
//  OAuthViewController.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/3/28.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit
import SVProgressHUD

class OAuthViewController: UIViewController {
    //MARK:- 控件属性
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "登录页面"
        // 1 设置导航栏的内容
        setupNavBar()
        // 2 加载网页
        loadPage()
        // 3 加载提示框
        SVProgressHUD.show()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        SVProgressHUD.dismiss()
    }

}
//MARK:- 设置UI界面相关/
extension OAuthViewController{
    // 设置导航栏的item
    func setupNavBar()  {
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "关闭", style: .plain, target: self, action: #selector(closeEvent))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "填充", style: .plain, target: self, action: #selector(fillinEvent))
    }
    
    
    func loadPage() {
        // 1 获取登录页面URLstring
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(APPKEY)&redirect_uri=\(REDIRECT_URL)"
        // 2 创建URL
        let url = NSURL(string: urlString)
        guard (url != nil) else {
            return
        }
        // 3 创建NSURLRequest对象
        let request = NSURLRequest(url: url! as URL)
        
        // 4 加载request对象
        webView.loadRequest(request as URLRequest)
        
    }
    
}

extension OAuthViewController{
    @objc func closeEvent(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func fillinEvent(){
        print("填充")
        // 1 书写js代码 ：JavaScript
        let jsCode = "document.getElementById('userId').value='15665889905';document.getElementById('passwd').value='HLY520521522';"
        // 2 执行js代码
        webView.stringByEvaluatingJavaScript(from: jsCode)
    }
}

//MARK:- webview的delegate
extension OAuthViewController:UIWebViewDelegate{
    // webview开始加载
    func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    // webview加载结束
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
    // webview加载失败
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        SVProgressHUD.dismiss()
    }
    
    // 当准备加载某一个页面时调用该方法
    // 返回值为true：继续加载该页面，false：不会加载该页面
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        // 阻止加载授权回调页面
        // 1 获取加载网页的NSURL
        let url = request.url
        guard (url != nil) else {
            return true
        }
        // 2 获取URL中的字符串
        let urlStr = url?.absoluteString
        // 3 判断字符串中是否包含code
        guard (urlStr?.contains("code="))! else {
            return true
        }
        // 4 包含code则截取出code
        let temp = urlStr?.components(separatedBy: "code=")
        let code  = temp?.last
        print(code!)
        return false// 不加载授权回调页面
    }
}
