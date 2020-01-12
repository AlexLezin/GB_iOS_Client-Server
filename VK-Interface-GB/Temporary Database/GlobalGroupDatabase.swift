
//  Created by Евгений Никитин on 02.12.2019.
//  Copyright © 2019 Evel-Devel. All rights reserved.

import UIKit


// MARK: - Иммитация глобального списка групп "на сервере"
class GlobalGroupsDatabase {
    static func getGlobalGroups() -> [Group] {
        return [
                Group(groupName: "Новости RT на русском", avatarPath: "group3", id: 11, kind: "Интернет-СМИ"),
                Group(groupName: "Пятый канал | Новости", avatarPath: "group4", id: 12, kind: "Интернет-СМИ"),
                Group(groupName: "РИА Новости", avatarPath: "group5", id: 13, kind: "Интернет-СМИ"),
                Group(groupName: "Forbes", avatarPath: "group6", id: 14, kind: "Бизнес"),
                Group(groupName: "Коммерсантъ", avatarPath: "group7", id: 15, kind: "Интернет-СМИ"),
                Group(groupName: "Парламентская газета", avatarPath: "group8", id: 16, kind: "Интернет-СМИ"),
                Group(groupName: "Государственная Дума", avatarPath: "group9", id: 16, kind: "Государственная организация"),
                Group(groupName: "Комсомольская правда", avatarPath: "group10", id: 16, kind: "Интернет-СМИ"),
                Group(groupName: "Новости RT на русском", avatarPath: "group3", id: 11, kind: "Интернет-СМИ"),
                Group(groupName: "Пятый канал | Новости", avatarPath: "group4", id: 12, kind: "Интернет-СМИ"),
                Group(groupName: "РИА Новости", avatarPath: "group5", id: 13, kind: "Интернет-СМИ"),
                Group(groupName: "Forbes", avatarPath: "group6", id: 14, kind: "Бизнес"),
                Group(groupName: "Коммерсантъ", avatarPath: "group7", id: 15, kind: "Интернет-СМИ"),
                Group(groupName: "Парламентская газета", avatarPath: "group8", id: 16, kind: "Интернет-СМИ"),
                Group(groupName: "Государственная Дума", avatarPath: "group9", id: 16, kind: "Государственная организация"),
                Group(groupName: "Комсомольская правда", avatarPath: "group10", id: 16, kind: "Интернет-СМИ")   ]
    }
}
