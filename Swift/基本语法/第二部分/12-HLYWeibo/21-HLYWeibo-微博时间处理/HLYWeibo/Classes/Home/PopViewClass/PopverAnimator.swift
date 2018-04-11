//
//  PopverAnimator.swift
//  HLYWeibo
//
//  Created by tzsoft on 2018/3/19.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit

class PopverAnimator: NSObject {
    
    //MARK:- 对外提供的属性
    var isPresent :Bool = false
    var presentedFrame :CGRect = CGRect.zero
    
    // 闭包的属性，反向传值 (参数类型) -> ()
    var callBack :((Bool) -> ())?// 初始没有值，所有要声明成可选类型
    
    //MARK:- 自定义构造函数
    // 注意：如果定义了一个构造函数，但是没有对默认的构造函数init（）进行重写，那么自定义的构造函数就会覆盖默认的init（）构造函数
    init(paraCallBack :@escaping (Bool) -> ()) {
        self.callBack = paraCallBack
    }
}

//MARK:-  遵守协议（自定义转场的协议）
extension PopverAnimator : UIViewControllerTransitioningDelegate{
    
    // 目的：改变弹出view的尺寸
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let presentation = HLYPresentationController(presentedViewController: presented, presenting: presenting)
        presentation.prensentdFrame = presentedFrame
        // 返回值
        return presentation
    }
    
    // 目的：自定义弹出的动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = true
        callBack!(isPresent)// 强制解包 ：callBack这个闭包是可选类型，可选类型
        return self
    }
    
    // 目的：自定消失动画
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
        callBack!(isPresent)
        return self
    }
    
}

//MARK:- 弹出和消失动画的代理方法
extension PopverAnimator :UIViewControllerAnimatedTransitioning{
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
