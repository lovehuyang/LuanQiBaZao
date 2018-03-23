//
//  ViewController.swift
//  09-AFNTools
//
//  Created by tzsoft on 2018/3/22.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        NetworkTools.shareInstance.request(requestType: .GET, urlStr: "http://httpbin.org/get", parameters: ["name":"hulyang" as AnyObject]) { (result :AnyObject?, error : Error?) in
            if (error == nil){
             print(result)
            }else{
                print("请求失败")
            }
        }
    }


}

