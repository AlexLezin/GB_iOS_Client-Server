
//  Created by Евгений Никитин on 11.12.2019.
//  Copyright © 2019 Evel-Devel. All rights reserved.


import UIKit

class MessageViewController: UITableViewController {
    
    override func viewDidLoad() {
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "SimpleMessage")
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    
    // MARK: - Кастомизируем список сообщений
    // Возвращаем количество ячеек
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageDatabase.getMessage().count
    }
    
    // Наполняем ячейку (шаблон)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Задаем массив (предотвращаем Runtime Error)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleMessage", for: indexPath) as? MessageCell else { return UITableViewCell() }
        
        // Заполняем шаблон нужной информацией
        cell.message.text = MessageDatabase.getMessage()[indexPath.row].messageText
        cell.avatar.image = UIImage(named: MessageDatabase.getMessage()[indexPath.row].avatarPath)
        cell.time.text = MessageDatabase.getMessage()[indexPath.row].messageTime
        cell.username.text = MessageDatabase.getMessage()[indexPath.row].username
        return cell
    }
}
