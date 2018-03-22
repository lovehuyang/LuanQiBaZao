//
//  HomeViewController.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/2/27.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    //MARK:- 属性
    var isPresent :Bool = false
    
    private var titleBtn = TitleButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visitorView.addRotationAnim()
        // 1 没有登录时
        if !isLogin {
            return
        }
        
        // 2 设置导航栏的内容
        setupNavBar();
    }
}

//MARK:- 设置UI界面
extension HomeViewController{
    
    private func setupNavBar(){
        // 1 设置左侧的item
        let leftBtn = UIButton()
        leftBtn.setImage(UIImage.init(named: "navigationbar_friendsearch_highlighted"), for: .normal)
        leftBtn.setImage(UIImage.init(named: "navigationbar_friendsearch"), for: .selected)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftBtn)
    
        // 2 设置右侧的item
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(imageName: "navigationbar_pop")
        
        // 3 设置标题栏
        titleBtn.setTitle("huxiaoyang", for: .normal)
        navigationItem.titleView = titleBtn
        titleBtn.addTarget(self, action: #selector(titleBtnClick), for: .touchUpInside)
        
    }
}

//MARK:- 点击事件
extension HomeViewController{
    @objc func titleBtnClick(btn :TitleButton){
        // 1 改变按钮的状态
        btn.isSelected = !btn.isSelected
        
        //2 创建弹出的控制器
        let povView = UIPopViewController()
        
        // 3 设置弹出控制器的样式(必须要设置)
        povView.modalPresentationStyle = .custom
        
        // 4 设置转场的代理
        povView.transitioningDelegate = self
        
        // 4 弹出控制器
        present(povView, animated: true, completion: nil)
    }
}

//MARK:-  遵守协议（自定义转场的协议）
extension HomeViewController : UIViewControllerTransitioningDelegate{
    
    // 目的：改变弹出view的尺寸
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        // 返回值
        return HLYPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    // 目的：自定义弹出的动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = true
        return self
    }
    
    // 目的：自定消失动画
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
        return self
    }

}

//MARK:- 弹出和消失动画的代理方法
extension HomeViewController :UIViewControllerAnimatedTransitioning{
    // 动画执行的时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    // 获取转场的上下文：可以通过转场上下文获取弹出的view和消失的view
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        isPresent ?animationForPresentedView(using: transitionContext):animationForDismissView(using: transitionContext)
    }
    
    //MARK:- 自定义弹出动画
    private func animationForPresentedView(using transitionContext: UIViewControllerContextTransitioning){
        // 1 获取弹出的view
        let presentView = transitionContext.view(forKey: .to)!
        
        //2 将弹出的view添加到containerView中
        transitionContext.containerView.addSubview(presentView)
        // 3 执行动画
        // 设置动画的初始尺寸
        presentView.transform = CGAffineTransform.init(scaleX: 1.0, y: 0.0)
        // 设置动画的锚点
        presentView.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0)
        UIView.animate(withDuration: 0.3, animations: {
            // 要执行的动画 （恢复最初的状态 ）
            presentView.transform = CGAffineTransform.identity
        }) { (_) in
           // 必须告诉上下文已经执行完动画
            transitionContext.completeTransition(true)
        }
    }
    
    //MARK:- 自定义消失动画
    private func animationForDismissView(using transitionContext: UIViewControllerContextTransitioning){
        // 1 获取消失的view
        let dismissView = transitionContext.view(forKey: .from)
        // 2 执行动画
        UIView.animate(withDuration: 0.3, animations: {
            dismissView?.transform = CGAffineTransform.init(scaleX: 1.0, y: 0.0001)
        }) { (_) in
       
            dismissView?.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
    }
}
