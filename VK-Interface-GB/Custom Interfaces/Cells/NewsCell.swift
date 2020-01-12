
//  Created by Евгений Никитин on 12.12.2019.
//  Copyright © 2019 Evel-Devel. All rights reserved.


import UIKit

class NewsCell: UITableViewCell {

    // Верх: Аватарка, Имя пользователя, дата поста
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var time: UILabel!
    
    // Середина: текст и картинка
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    // Низ, контролы: лайк, комментарий, репост, просмотры
    @IBAction func likeButton(_ sender: Any) { (sender as! LikeButton).like() }
    @IBAction func repost(_ sender: Any) { }
    @IBAction func comments(_ sender: Any) { }
    @IBOutlet weak var viewsCounter: UILabel!
}
