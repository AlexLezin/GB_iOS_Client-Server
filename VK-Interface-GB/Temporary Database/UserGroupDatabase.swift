
//  Created by Евгений Никитин on 17.12.2019.
//  Copyright © 2019 Evel-Devel. All rights reserved.

import UIKit


// MARK: - Иммитация списка групп "на сервере" (Вебинар №7)
class GroupsDatabase {
    static func getGroups() -> [Group] {
       return [
        Group(groupName: "FaitalPRO", avatarPath: "group11", id: 1, kind: "Автотовары"),
        Group(groupName: "БАЗА АВТОЗВУКА R2V", avatarPath: "group12", id: 2, kind: "Открытая группа"),
        Group(groupName: "SwiftBook", avatarPath: "group13", id: 3, kind: "Открытая группа"),
        Group(groupName: "Desound Studio", avatarPath: "group14", id: 4, kind: "Открытая группа"),
        Group(groupName: "R.AUDIO | Акустика", avatarPath: "group15", id: 5, kind: "Открытая группа"),
        Group(groupName: "ТРИ ВТОРЫХ [3/2]", avatarPath: "group16", id: 6, kind: "Открытая группа"),
        Group(groupName: "Ledvizor", avatarPath: "group17", id: 7, kind: "Производство, промышленность"),
        Group(groupName: "Spektr", avatarPath: "group18", id: 8, kind: "Открытая группа"),
        Group(groupName: "Мысли Шире", avatarPath: "group19", id: 9, kind: "Закрытая группа"),
        Group(groupName: "FaitalPRO", avatarPath: "group11", id: 1, kind: "Автотовары"),
        Group(groupName: "БАЗА АВТОЗВУКА R2V", avatarPath: "group12", id: 2, kind: "Открытая группа"),
        Group(groupName: "SwiftBook", avatarPath: "group13", id: 3, kind: "Открытая группа"),
        Group(groupName: "Desound Studio", avatarPath: "group14", id: 4, kind: "Открытая группа"),
        Group(groupName: "R.AUDIO | Акустика", avatarPath: "group15", id: 5, kind: "Открытая группа"),
        Group(groupName: "ТРИ ВТОРЫХ [3/2]", avatarPath: "group16", id: 6, kind: "Открытая группа"),
        Group(groupName: "Ledvizor", avatarPath: "group17", id: 7, kind: "Производство, промышленность"),
        Group(groupName: "Spektr", avatarPath: "group18", id: 8, kind: "Открытая группа"),
        Group(groupName: "Мысли Шире", avatarPath: "group19", id: 9, kind: "Закрытая группа") ]
    }
}
