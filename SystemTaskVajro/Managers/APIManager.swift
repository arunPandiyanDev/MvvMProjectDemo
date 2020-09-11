//
//  APIManager.swift
//  SystemTaskVajro
//
//  Created by mac on 03/09/20.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftyJSON

class APIManager: BaseService {
    
    static let shared = APIManager()
    

    func getiOSApps(callback: @escaping (_ error: String?, _ data: JSON?) -> Void) {
           let request = buildRequest(url: "https://run.mocky.io/v3/cdc1c53e-2825-4162-826d-b8294e477934")
           self.request(request: request) { (error, data) in
               if let error = error {
                   callback(error, nil)
                   return
               }
               print(data)
               callback(nil, data)
           }
    }
}
