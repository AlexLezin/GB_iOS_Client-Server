
//  Created by Евгений Никитин on 02.12.2019.
//  Copyright © 2019 Evel-Devel. All rights reserved.


import UIKit


class GroupList: UITableViewController {

    // Свойство для Pull-to-Refresh
    var customRefreshControl = UIRefreshControl()

    
    // MARK: - Получаем список "с сервера", добавляем SearchBar (Вебинар №7)
    var groups = GroupsDatabase.getGroups()
    @IBOutlet weak var groupSearchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        addRefreshControl()
        groupSearchBar.delegate = self
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
    
    
    // MARK: - Pull-to-Refresh (Обновление страницы)
    // Кастомизируем поведение
    func addRefreshControl() {
        customRefreshControl.attributedTitle = NSAttributedString(string: "Обновляем страницу")
        customRefreshControl.addTarget(self, action: #selector(refreshTable), for: .valueChanged)
        tableView.addSubview(customRefreshControl)
    }
    
    // Функция с заглушкой (чтобы обновление прекращалось через 2 секунды)
    @objc func refreshTable() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.customRefreshControl.endRefreshing()
        }
    }
    
    
    // MARK: - Количество ячеек в секции
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    

    // MARK: - Устанавливаем шаблон и наполняем ячейку
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Prevent Fatal Error
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTemplate", for: indexPath) as? GroupCell else {
            return UITableViewCell()
        }
        // Передаем название и аватарку
        cell.groupname.text = groups[indexPath.row].groupName
        cell.avatar.image = UIImage(named: groups[indexPath.row].avatarPath)
        cell.groupKind.text = groups[indexPath.row].kind
        return cell
    }
    
    
    // MARK: - Добавление сообщества к себе в список (через unwind segue)
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        // Проверяем, что вызывается нужный сигвей
        if segue.identifier == "addGroup" {
            // Получаем ссылку на контроллер, с которого осуществлен переход
            guard let SearchGroupList = segue.source as? SearchGroupList else { return }
            // Получаем индекс выделенной ячейки
            if let indexPath = SearchGroupList.tableView.indexPathForSelectedRow {
                // Получаем экземпляр сообщества по индексу
                let group = SearchGroupList.globalGroups[indexPath.row].self
                // Проверка на дубликаты (повторно не добавляем)
                if !groups.contains(where: {
                    (element) -> Bool in if group.id == element.id { return true } else { return false } } ) {
                        groups.append(group)
                        tableView.reloadData()
                }
            }
        }
    }
    
    
    // MARK: - Удаление сообщества по свайпу ячейки влево
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            // Удаляем город из массива
            groups.remove(at: indexPath.row)
            // И удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}



// MARK: - Расширение "Подключения Search Bar" (Вебинар №7)
extension GroupList: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        groups = GroupsDatabase.getGroups().filter { (group) -> Bool in
            return searchText.isEmpty ? true : group.groupName.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    // Скрываем клавиатуру после нажатия "search"
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) { view.endEditing(true) }
}
