//
//  WebViewController.swift
//  SystemTaskVajro
//
//  Created by mac on 03/09/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate {

    var webView: WKWebView!
    var bodyTextStr = ""
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        webView.loadHTMLString(bodyTextStr, baseURL: nil)
        webView.allowsBackForwardNavigationGestures = true
       
    }
}
