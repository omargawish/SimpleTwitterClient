//
//  API.swift
//  SimpleTwitterClient
//
//  Created by omer gawish on 8/29/17.
//  Copyright © 2017 Gawish. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import TwitterKit


public typealias callback = (APIResponse) -> Void


public enum APIResponse {
    case sucess(object:Any)
    case error(error:APIError)
}

public enum APIResponseType {
    case string
    case json
}

public struct APIError {
    let errorCode:Int
    let errorMessage:String!
}

class API {
    
    public static let shared = API()
    private init() {}
    
    public func requestJSON(request:URLRequest, completionHandler:@escaping callback) {
        if let userid = Twitter.sharedInstance().sessionStore.session()?.userID {
            let client = TWTRAPIClient(userID: userid)
            
            client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
                if connectionError != nil {
                    print("Error: \(String(describing: connectionError))")
                    completionHandler(.error(error: APIError(errorCode: -2, errorMessage: R.string.localization.noInternetConnection())))
                }
                
                do {
                    if let data = data {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print("json: \(json)")
                        completionHandler(.sucess(object: json))
                    }
                } catch let jsonError as NSError {
                    print("json error: \(jsonError.localizedDescription)")
                    completionHandler(.error(error: APIError(errorCode: jsonError.code, errorMessage: jsonError.localizedDescription)))
                }
            }
        } else {
            completionHandler(.error(error: APIError(errorCode: 401, errorMessage: R.string.localization.userIsUnauthorized())))
        }
    }
    
    func handleStatusCodes(statusCode:Int!) -> Bool {
        if let statusCode = statusCode , (statusCode >= 200 && statusCode < 205) {
            return true
        } else {
            return false
        }
    }
    
    func isAuthorized(statusCode:Int!) -> Bool {
        if let statusCode = statusCode , statusCode == 401 {
            return false
        } else {
            return true
        }
    }
}
