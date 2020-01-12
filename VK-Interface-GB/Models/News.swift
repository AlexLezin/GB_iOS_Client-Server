
//  Created by Евгений Никитин on 12.12.2019.
//  Copyright © 2019 Evel-Devel. All rights reserved.


import UIKit

class News {
    var avatarPath:     String
    var username:       String
    var newsTime:       String
    var newsText:       String
    var newsImage:      String
    var viewsCounter:   String
    
    init(avatarPath: String, username: String, newsTime: String, newsText: String, newsImage: String, viewsCounter: String) {
        self.avatarPath =   avatarPath
        self.username =     username
        self.newsText =     newsText
        self.newsTime =     newsTime
        self.newsImage =    newsImage
        self.viewsCounter = viewsCounter
    }
    
}

