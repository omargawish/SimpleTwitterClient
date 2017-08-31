//
//  TwitterRouter.swift
//  SimpleTwitterClient
//
//  Created by omer gawish on 8/30/17.
//  Copyright © 2017 Gawish. All rights reserved.
//

import Foundation
import Alamofire
import TwitterKit

enum TwitterRouter {
    
    case listFollowers(userId:String,cursor:Int)
    case listTweets(userId:String)

    
    static let baseURLString = Constants.twitterAPIBaseURL
    
    var method: HTTPMethod {
        switch self {
        case .listFollowers(_, _),.listTweets( _):
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .listFollowers:
            return Constants.TwitterRouter.listFollowers
        case .listTweets:
            return Constants.TwitterRouter.listTweets
        }
    }
    
    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try TwitterRouter.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        var clientError : NSError?
        if let userId = Twitter.sharedInstance().sessionStore.session()?.userID {
        let client = TWTRAPIClient(userID: userId)
        
        switch self {
        case .listFollowers(let userId,let cursor):
            let jsonParameters:[String:Any] = ["user_id":userId]
            if cursor > 0 {
                urlRequest = try URLEncoding.default.encode(urlRequest, with: ["cursor":cursor])
            }
            urlRequest = client.urlRequest(withMethod: self.method.rawValue, url: (urlRequest.url?.absoluteURL.absoluteString)!, parameters: jsonParameters, error: &clientError)
        case .listTweets(let followerId):
            let jsonParameters:Parameters = ["id":followerId,"count":String(10)]
            //urlRequest = try URLEncoding.default.encode(urlRequest, with: ["user_id":userId])
            urlRequest = client.urlRequest(withMethod: self.method.rawValue, url: (urlRequest.url?.absoluteURL.absoluteString)!, parameters: jsonParameters, error: &clientError)
        }
        
        }
        return urlRequest
    }
}
