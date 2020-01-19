//
//  VKApi.swift
//  VK-Interface-GB
//
//  Created by Alexander Lezin on 19.01.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.
//

import UIKit
import Alamofire

class VKapi {
    
    let vkApiVersion = "5.103"
    
    let vkURL = "https://api.vk.com/method"
    
    func getFriendsList(token: String) {
        
        let requestURL = vkURL + "/friends.get"
        let params = ["access_token": token, "v": vkApiVersion,]
        
        Alamofire.request(requestURL,
                          method: .post,
                          parameters: params).responseJSON(completionHandler: {(response) in
                            print(response.value!)
            })
    }
    
    func getPhotos(token: String) {
        
        let requestURL = vkURL + "/photos.get"
        let params = ["access_token": token, "v": vkApiVersion, "album_id": "wall"]
        
        Alamofire.request(requestURL,
                          method: .post,
                          parameters: params).responseJSON(completionHandler: {(response) in
                            print(response.value!)
            })
    }
    
    func getGroups(token: String) {
        
        let requestURL = vkURL + "/groups.get"
        let params = ["access_token": token, "v": vkApiVersion]
        
        Alamofire.request(requestURL,
                          method: .post,
                          parameters: params).responseJSON(completionHandler: {(response) in
                            print(response.value!)
            })
    }
    
    func getGroupsSearch(token: String) {
        
        let searchQ = "Music"
        let requestURL = vkURL + "/groups.search"
        let params = ["access_token": token, "v": vkApiVersion, "q": searchQ]
        
        Alamofire.request(requestURL,
                          method: .post,
                          parameters: params).responseJSON(completionHandler: {(response) in
                            print(response.value!)
            })
    }
}
