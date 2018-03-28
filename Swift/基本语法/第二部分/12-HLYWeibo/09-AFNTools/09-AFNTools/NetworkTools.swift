//
//  NetworkTools.swift
//  09-AFNTools
//
//  Created by tzsoft on 2018/3/27.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import UIKit
import Alamofire

enum RequestType {
    case get
    case post
}
class NetworkTools: NSObject {
    static let shareInstance : NetworkTools = {
        let tools = NetworkTools()
        return tools
    }()
}


/*
 
 case .success:
 if let value = response.result.value {
 success(value)
 }
 case .failure(let error):
 failure(error)
 }
 */
extension NetworkTools {
    
    func request(url:String, requestType:RequestType, parameters:[String : Any]? = nil,success:@escaping (_ response : AnyObject?)->(), failure : @escaping (_ error : Error)->()){
        
        let method = requestType == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(url, method: method, parameters: parameters).responseJSON { (responeObj) in
            if responeObj.result.isSuccess{
                success(responeObj.result.value as AnyObject )
            }else{
                failure(responeObj.result.error!)
            }
        }
    }
}

