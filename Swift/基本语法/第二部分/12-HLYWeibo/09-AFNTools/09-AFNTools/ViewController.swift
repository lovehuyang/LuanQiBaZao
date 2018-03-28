//
//  ViewController.swift
//  09-AFNTools
//
//  Created by tzsoft on 2018/3/22.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NetworkTools.shareInstance.getRequest(url: "http://httpbin.org/get", requestType: .get,parameters: ["name":"huluyang"], success: { (respongObj) in
            print(respongObj!)
            let dataDict = respongObj
            print(dataDict!["url"]!)
            
        }) { (error) in
            print(error)
        }
    }
}

