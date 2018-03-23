//
//  NetworkTools.swift
//  09-AFNTools
//
//  Created by tzsoft on 2018/3/22.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

import AFNetworking

class NetworkTools: AFHTTPSessionManager {

    enum RequestType {
        case POST
        case GET
    }
    
    // 创建单例 (swift 中创建单例很简单 )
    // let 可以保证线程安全（即使是多线程访问也能保证只创建一次）
    static let shareInstance :NetworkTools = {
        let tools = NetworkTools()
        tools.responseSerializer.acceptableContentTypes = ["text/html"]
        return tools
    }()
}

//MARK:- 封装请求方法
extension NetworkTools{
    
    func request(requestType : RequestType , urlStr : String , parameters : [String : AnyObject] , finishde :@escaping (_ result : AnyObject? , _ error : Error?) -> ())  {
        
        let successBack = {(task :URLSessionDataTask , result : Any?) -> Void in finishde(result as AnyObject , nil)
        }
        let failureBack = {(task :URLSessionDataTask? , error : Error) -> Void in finishde(nil , error)
        }
        
        if requestType == .GET{
            get(urlStr, parameters: parameters, progress: nil, success: successBack, failure: failureBack)
        }else{
            post(urlStr, parameters: parameters, progress: nil, success: successBack, failure: failureBack)
        }
        
    }

}
