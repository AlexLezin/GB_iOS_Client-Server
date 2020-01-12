
//  Created by Евгений Никитин on 12.12.2019.
//  Copyright © 2019 Evel-Devel. All rights reserved.

import UIKit

class NewsViewController: UITableViewController {
    
    override func viewDidLoad() {
        newsCellRegister()
    }
    
    // Регистрируем шаблон новости
    func newsCellRegister() {
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "SimpleNews")
        tableView.estimatedRowHeight = 400.0
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    // Количество ячеек
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  NewsDatabase.getNews().count
    }
    
    // Кастомизация
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleNews", for: indexPath) as? NewsCell else {
            return UITableViewCell()
        }
        // Заполняем ячейку нужной информацией
        cell.username.text = NewsDatabase.getNews()[indexPath.row].username
        cell.time.text = NewsDatabase.getNews()[indexPath.row].newsTime
        cell.avatar.image = UIImage(named: NewsDatabase.getNews()[indexPath.row].avatarPath)
        cell.postText.text = NewsDatabase.getNews()[indexPath.row].newsText
        cell.postImage.image = UIImage(named: NewsDatabase.getNews()[indexPath.row].newsImage)
        cell.viewsCounter.text = NewsDatabase.getNews()[indexPath.row].viewsCounter
        return cell
    }
}
