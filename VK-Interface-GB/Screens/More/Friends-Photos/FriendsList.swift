
//  Created by Евгений Никитин on 01.12.2019.
//  Copyright © 2019 Evel-Devel. All rights reserved.

import UIKit


// MARK: - Структура-дженерик для формирования "секций" элементов
struct Section<T> {
    var title: String
    var items: [T]
}


// MARK: - Основная работа со страницей друзей
class FriendsList: UITableViewController {
    
    // Search Bar
    @IBOutlet weak var friendsSearchBar: UISearchBar!

    // Пустой массив для группировок по секциям
    var sortedFriends = [Section<User>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsSearchBar.delegate = self
        makeSortedSections()
        updateNavigationBar()
    }
    
    
    // MARK: - Кастомизируем Navigation Bar (страница "Фотографии")
    func updateNavigationBar() {
        //Убираем надпись на кнопке возврата
        let backButtonItem = UIBarButtonItem()
        backButtonItem.title = ""
        backButtonItem.tintColor = .white
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButtonItem
    }
    
    
    // MARK: - Формирование секций
    // Группировка в секции (массивы) и сортировка этих массивов (по фамилии)
    private func makeSortedSections() {
        let groupedFriends = Dictionary.init(grouping: FriendsDatabase.getFriends()) { $0.surname.prefix(1) }
        sortedFriends = groupedFriends.map { Section(title: String($0.key), items: $0.value) }
        sortedFriends.sort { $0.title < $1.title }
    }
    
    // Количество секций
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sortedFriends.count
    }
    
    // Кастомные заголовки секций (Первая буква "ключа" нашего словаря)
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.white
        let label = UILabel()
        label.text = sortedFriends[section].title
        label.frame = CGRect(x: 10, y: 15, width: 8, height: 15)
        label.textColor = UIColor.darkGray
        label.adjustsFontSizeToFitWidth = true
        view.addSubview(label)
        return view
    }
    
    
    // MARK: - Формирование строк и ячеек
    // Количество строк (ячеек) таблицы
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedFriends[section].items.count
    }
    
    // Устанавливаем шаблон и наполняем ячейку
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Prevent Fatal Error
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTemplate", for: indexPath) as? FriendCell else {
            return UITableViewCell()
        }
        // Вывод имя и фамилию
        let username = sortedFriends[indexPath.section].items[indexPath.row].username
        let surname = sortedFriends[indexPath.section].items[indexPath.row].surname
        cell.username.text = username + " " + surname
        // Выводим аватарку пользователя
        cell.avatar.image = UIImage(named: sortedFriends[indexPath.section].items[indexPath.row].avatarPath)
        return cell
    }
    
    
    // MARK: - Переход на фотографии по нажатию на ячейку
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let username = sortedFriends[indexPath.section].items[indexPath.row].username
        let surname = sortedFriends[indexPath.section].items[indexPath.row].surname
        let storyboard = UIStoryboard(name: "More", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "PhotoList") as! PhotoList
        viewController.user = username + " " + surname
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    // MARK: - Контрол поиска по алфавиту
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sortedFriends.map { $0.title }
    }
    
    
    // MARK: - Действия по свайпу друга (пока закоментил, чтобы убрать depricated notification)
    /* override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // Реализация кнопки "Поделиться"
        let shareAction = UITableViewRowAction(style: .default, title: "Share") { (action, index) in
            print("Share information by \(index.section) \(index.row)")
        }
        shareAction.backgroundColor = .systemIndigo
        // Реализация кнопки "Передать" / "Переслать"
        let forwardAction = UITableViewRowAction(style: .default, title: "Forward") { (action, index) in
            print("Forward information by \(index.section) \(index.row)")
        }
        forwardAction.backgroundColor = .orange
        return [shareAction, forwardAction]
    } */
}



// MARK: - Расширение для подключения Search Bar (пока поиск только по имени)
extension FriendsList: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Функция поиска с фильтрацией по введенному в строку поиска тексту
        let groupedFriends = Dictionary.init(grouping: FriendsDatabase.getFriends().filter { (user) -> Bool in
            // Если поле пустое, показываем всех юзеров : иначе показываем результат поиска
            return searchText.isEmpty ? true : user.username.lowercased().contains(searchText.lowercased())
        }) { $0.surname.prefix(1) }
        
        // Реализация группирования в секции
        sortedFriends = groupedFriends.map { Section(title: String($0.key), items: $0.value) }
        sortedFriends.sort { $0.title < $1.title }
        tableView.reloadData()
    }
    
    // Когда нажимаем кнопку поиска - скрываем клавиатуру
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}


