//
//  ViewModelList.swift
//  SystemTaskVajro
//
//  Created by mac on 04/09/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper


public enum ResponseType{
    case success,failure
}

protocol ApiResponseDelegate{
   func response(type:ResponseType,message:String,apiNo:Int)
}

class ViewModelList: BaseService {
   
    var delegateVC: ApiResponseDelegate!
    var iOSApps: AppleMusicAndApp? {
              didSet {
                delegateVC.response(type: .success, message: "success", apiNo: 0)
              }
          }
    
    override init() {
        print("init called")
    }
   
    
    //
    func getiOSApp() {
        APIManager.shared.getiOSApps { (error, data) in
                     if error != nil {
                        self.delegateVC.response(type: .failure, message: "error", apiNo: 0)
                        // self.showAlert(title: "Opps", message: error ?? "Something went wrong")
                         return
                     }
                     self.iOSApps = Mapper<AppleMusicAndApp>().map(JSONObject: data?.object)
                 }
             }
        
}
