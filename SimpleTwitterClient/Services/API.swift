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
    
    public func requestJSON(url:URLRequestConvertible, completionHandler:@escaping callback) {
        _ = Alamofire.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let value) :
                if let value = value as? [String:Any] {
                    if self.handleStatusCodes(statusCode: response.response?.statusCode) {
                        completionHandler(APIResponse.sucess(object: value))
                    } else if !self.isAuthorized(statusCode: response.response?.statusCode){
                        // self.kickout()
                    } else {
                        if let response = response.response {
                            let message = value[Constants.API.message]
                            if let message = message as? String {
                                let error = APIError(errorCode: response.statusCode, errorMessage: message)
                                completionHandler(APIResponse.error(error: error))
                            }
                            let error = APIError(errorCode: response.statusCode, errorMessage: nil)
                            completionHandler(APIResponse.error(error: error))
                        } else {
                            // Unknown error
                            let error = APIError(errorCode: -1, errorMessage: nil)
                            completionHandler(APIResponse.error(error: error))
                        }
                        
                    }
                } else if let value = value as? Array<Any> {
                    completionHandler(.sucess(object: value))
                } else {
                    completionHandler(APIResponse.sucess(object: Constants.API.response.success))
                }
                break
                
            case .failure(let error) :
                var errorCode = -1
                if let statusCode = response.response?.statusCode {
                    errorCode = statusCode
                }
                completionHandler(APIResponse.error(error: APIError(errorCode:errorCode , errorMessage: error.localizedDescription)))
                break
            }
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
