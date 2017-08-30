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
        let client = TWTRAPIClient()
        
        switch self {
        case .listFollowers(let userId,let cursor):
            let jsonParameters:Parameters = ["user_id":userId,"cursor":cursor]
            urlRequest = client.urlRequest(withMethod: self.method.rawValue, url: self.path, parameters: jsonParameters, error: &clientError)
        case .listTweets(let userId):
            let jsonParameters:Parameters = ["user_id":userId]
            urlRequest = client.urlRequest(withMethod: self.method.rawValue, url: self.path, parameters: jsonParameters, error: &clientError)
        }
        
        
        return urlRequest
    }
}
