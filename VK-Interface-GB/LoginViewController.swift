//
//  LoginViewController.swift
//  VK-Interface-GB
//
//  Created by Alexander Lezin on 19.01.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.
//

import UIKit
import WebKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var webview: WKWebView! {
        didSet {
            webview.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7287106"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "revoke", value: "1"),
        ]
        let request = URLRequest(url: urlComponents.url!)
        
        webview.load(request)
        
    }
}

extension LoginViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        guard let token = params["access_token"] else {
            return
        }
        guard let userId = params["user_id"] else {
            return
        }
        
        Session.shared.token = token
        Session.shared.userId = Int(userId) ?? 0
        
        print(Session.shared.token, Session.shared.userId)
        
        let api = VKapi()
        
        api.getFriendsList(token: Session.shared.token)
        api.getPhotos(token: Session.shared.token)
        api.getGroups(token: Session.shared.token)
        api.getGroupsSearch(token: Session.shared.token)
        
        decisionHandler(.cancel)
    }
}


