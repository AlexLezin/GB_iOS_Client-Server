
//  Created by Евгений Никитин on 01.12.2019.
//  Copyright © 2019 Evel-Devel. All rights reserved.

import UIKit


// MARK: - Иммитация списка друзей "на сервере" (Вебинар №7)
class FriendsDatabase {
    static func getFriends() -> [User] {
       return [
                User(username: "Татьяна", surname: "Никитина",  isOnline: false, avatarPath: "2"),
                User(username: "Евгений", surname: "Никитин", isOnline: false, avatarPath: "3"),
                User(username: "Андрей", surname: "Никитин", isOnline: false, avatarPath: "1"),
                User(username: "Дениc", surname: "Бутерус", isOnline: false, avatarPath: "user"),
                User(username: "Валерия", surname: "Бутерус", isOnline: false, avatarPath: "user2"),
                User(username: "Сергей", surname: "Хлимоненко", isOnline: false, avatarPath: "2"),
                User(username: "Виктор", surname: "Качаев", isOnline: false, avatarPath: "1"),
                User(username: "Георгий", surname: "Ворожейкин", isOnline: false, avatarPath: "3"),
                User(username: "Артем", surname: "Алилеков", isOnline: false, avatarPath: "user2"),
                User(username: "Ксения", surname: "Ворожейкина", isOnline: false, avatarPath: "user"),
                User(username: "Наталья", surname: "Беседина", isOnline: false, avatarPath: "user2"),
                User(username: "Илья", surname: "Сураев", isOnline: false, avatarPath: "2"),
                User(username: "Дмитрий", surname: "Коробейников", isOnline: false, avatarPath: "1"),
                User(username: "Миша", surname: "Рахмалевич", isOnline: false, avatarPath: "3"),
                User(username: "Кирилл", surname: "Яровой", isOnline: false, avatarPath: "user"),
                User(username: "Егор", surname: "Родионов", isOnline: false, avatarPath: "2"),
                User(username: "Евгений", surname: "Яровенко", isOnline: false, avatarPath: "user2"),
                User(username: "Игорь", surname: "Шалютов", isOnline: false, avatarPath: "1"),
                User(username: "Олег", surname: "Цыганков",  isOnline: false, avatarPath: "2"),
                User(username: "Ольга", surname: "Гаврилова", isOnline: false, avatarPath: "3"),
                User(username: "Заур", surname: "Дзахоев", isOnline: false, avatarPath: "1"),
                User(username: "Захар", surname: "Евсеев", isOnline: false, avatarPath: "user"),
                User(username: "Мария", surname: "Жданова", isOnline: false, avatarPath: "user2"),
                User(username: "Юлия", surname: "Захарченко", isOnline: false, avatarPath: "2"),
                User(username: "Степан", surname: "Литвинов", isOnline: false, avatarPath: "1"),
                User(username: "Михаил", surname: "Москаленко", isOnline: false, avatarPath: "3"),
                User(username: "Евгений", surname: "Ошаров", isOnline: false, avatarPath: "user2"),
                User(username: "Илья", surname: "Сураев", isOnline: false, avatarPath: "user")      ]
    }
}
