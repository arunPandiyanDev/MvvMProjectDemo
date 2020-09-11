//
//  BaseService.swift
//  SystemTaskVajro
//
//  Created by mac on 03/09/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BaseService {
    
    func buildRequest(url: String, method: HTTPMethod = .get) -> URLRequest {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = method.rawValue
        return request
    }
    
    func request(request: URLRequestConvertible, method: HTTPMethod = .get, callback: @escaping(_ error: String?, _ data: JSON) -> Void) {
        AF.request(request).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                guard let valueDictionary = value as? [String: Any] else {
                    callback("Unknown error. Please try again", [])
                    return
                }
                print("result fetched successfull")
                callback(nil, JSON(value))
            case .failure(let error):
                callback(error.localizedDescription, [])
            }
        }
    }
    
}

