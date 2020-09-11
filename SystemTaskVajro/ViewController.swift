//
//  ViewController.swift
//  SystemTaskVajro
//
//  Created by mac on 02/09/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import SDWebImage
import ObjectMapper


class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    @IBOutlet weak var imagesTableview: UITableView!
    // viewmodel
    let viewModelList = ViewModelList()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModelList.delegateVC = self
        getiOSApp()
    }
}

extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelList.iOSApps?.articlesFeed?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell") as! ImageTableViewCell
        cell.setUpCell(articlesObject: viewModelList.iOSApps?.articlesFeed?[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = WebViewController()
        vc.bodyTextStr = viewModelList.iOSApps?.articlesFeed?[indexPath.row].bodyText ?? ""
        self.present(vc, animated: true, completion: nil)
    }
}


extension ViewController:ApiResponseDelegate {
    func getiOSApp() {
        viewModelList.getiOSApp()
    }
    func response(type: ResponseType, message: String, apiNo: Int) {
        switch type{
        case .success:
            DispatchQueue.main.async {
                self.imagesTableview.reloadData()
            }
        case .failure:
            self.showAlert(message: message)
        }
    }
  func showAlert(title: String = "Error", message: String) {
         let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
         alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
         present(alertController, animated: true, completion: nil)
     }
    
}
