
//  Created by Евгений Никитин on 02.12.2019.
//  Copyright © 2019 Evel-Devel. All rights reserved.


import UIKit


class SearchGroupList: UITableViewController {

    // Search Bar
    @IBOutlet weak var globalGroupSearch: UISearchBar!
    

    // MARK: - Список групп, с которым мы будем взаимодействовать в жизненном цикле
    var globalGroups = GlobalGroupsDatabase.getGlobalGroups()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        globalGroupSearch.delegate = self
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
    
    
    // MARK: - Указываем количество ячеек в секции (у нас пока одна)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globalGroups.count
    }
    
    
    // MARK: - Указываем шаблон и наполняем ячейку
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchGroupTemplate", for: indexPath) as! SearchGroupCell
        cell.groupName.text = globalGroups[indexPath.row].groupName
        cell.avatar.image = UIImage(named: globalGroups[indexPath.row].avatarPath)
        cell.groupKind.text = globalGroups[indexPath.row].kind
        return cell
    }
}



// MARK: - Расширение для подключения Search Bar
extension SearchGroupList: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        globalGroups = GlobalGroupsDatabase.getGlobalGroups().filter { (group) -> Bool in
            return searchText.isEmpty ? true : group.groupName.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    // Скрываем клавиатуру после нажатия "search"
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) { view.endEditing(true) }
}
