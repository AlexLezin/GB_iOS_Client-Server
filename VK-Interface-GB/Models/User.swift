
//  Created by Евгений Никитин on 02.12.2019.
//  Copyright © 2019 Evel-Devel. All rights reserved.


import UIKit

class User {
    var username:   String
    var surname:    String
    var isOnline:   Bool
    var avatarPath: String
    
    init(username: String, surname: String, isOnline: Bool, avatarPath: String) {
        self.username = username
        self.surname = surname
        self.isOnline = isOnline
        self.avatarPath = avatarPath
    }
}
