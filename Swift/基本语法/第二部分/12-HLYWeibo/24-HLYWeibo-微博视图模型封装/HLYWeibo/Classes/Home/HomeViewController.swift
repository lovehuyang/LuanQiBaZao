//
//  HomeViewController.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/2/27.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    
    private var titleBtn = TitleButton()
    
    private lazy var statusArr : [StatusViewModel] = [StatusViewModel]()// 存放微博数据的数组
    
    // 避免强制引用 [weak self]
    private lazy var popverAnimarot = PopverAnimator { [weak self](isPresent) in
        self?.titleBtn.isSelected = isPresent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 1 没有登录时
        if !isLogin {
            visitorView.addRotationAnim()
            return
        }
        
        // 2 设置导航栏的内容
        setupNavBar();
        getWeiBoInfo()
    }
}

//MARK:- 设置UI界面
extension HomeViewController{
    
    private func setupNavBar(){
        // 1 设置左侧的item
        let leftBtn = UIButton()
        leftBtn.frame = CGRect.init(x: 0, y: 0, width: 44, height: 44)
        leftBtn.setImage(UIImage.init(named: "navigationbar_friendsearch_highlighted"), for: .normal)
        leftBtn.setImage(UIImage.init(named: "navigationbar_friendsearch"), for: .selected)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftBtn)
    
        // 2 设置右侧的item
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "navigationbar_pop"), style: .plain, target: self, action: #selector (titleBtnClick))
        
        // 3 设置标题栏
        titleBtn.setTitle("huxiaoyang", for: .normal)
        navigationItem.titleView = titleBtn
        titleBtn.addTarget(self, action: #selector(titleBtnClick), for: .touchUpInside)
        
    }
}

//MARK:- 点击事件
extension HomeViewController{
    @objc func titleBtnClick(btn :TitleButton){
        
        // 1 创建弹出的控制器
        let povView = UIPopViewController()
        
        // 2 设置弹出控制器的样式(必须要设置)
        povView.modalPresentationStyle = .custom
        
        // 3 设置转场的代理
        povView.transitioningDelegate = popverAnimarot
        popverAnimarot.presentedFrame = CGRect.init(x: 100, y: 100, width: 180, height: 250)
        
        // 4 弹出控制器
        present(povView, animated: true, completion: nil)
    }
}

extension HomeViewController{
  
    //MARK:- 获取微博数据
    private func getWeiBoInfo()  {
        NetworkTools.shareInstance.request(url: "\(BASE_IP)2/statuses/home_timeline.json", requestType: .get, parameters: ["access_token":UserAccountViewModel.shareInstance.account?.access_token ?? ""], success: { (requestObj) in

            //1、 获取可选类型中的数据
            let resultDict = requestObj as! [String : AnyObject]
            let resultArr = resultDict["statuses"] as! [[String : AnyObject]]

            //2、 遍历字典
            for statusDict in resultArr{
                let  status =  Status.init(dict: statusDict)
                let statusViewModel = StatusViewModel.init(status: status)
                self.statusArr.append(statusViewModel)
            }
            
            //3、 刷新tableview
            self.tableView.reloadData()
        }) { (error ) in
            print(error)
        }
    }
}

//MARK:- tableview的代理方法
extension HomeViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1、 通过storyBoard创建cell
        let cell  = tableView.dequeueReusableCell(withIdentifier: "HomeCell")!
        //2、 给cell设置数据
        let statusViewModel : StatusViewModel = statusArr[indexPath.row]
        let status = statusViewModel.status!
        let user : User = status.user!
        cell.textLabel?.text = user.screen_name
        cell.detailTextLabel?.text = statusViewModel.sourceText
        cell.selectionStyle = .none
        return cell
    }
}
