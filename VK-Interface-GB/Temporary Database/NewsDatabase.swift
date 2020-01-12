
//  Created by Евгений Никитин on 17.12.2019.
//  Copyright © 2019 Evel-Devel. All rights reserved.

import UIKit


// MARK: - Заглушка "Массив новостей" (Вебинар №6)
class NewsDatabase {
    static func getNews() -> [News] {
        
        return [
        News(avatarPath: "user", username: "Евгений Никитин", newsTime: "Сегодня в 13:16", newsText: "А вы знали, что сценарий для Один дома был написан вместе с другим фильмом, за выходные? На Netflix вышла серия из 4 эпизодов, про фильмы-легенды, под названием Movies that made us. Я посмотрел только про Один дома, и всем советую. Очень противоречивый опыт, одновременно и 😊, и 😔", newsImage: "News-2", viewsCounter: "69"),
        
        News(avatarPath: "user", username: "Никитин Евгений", newsTime: "Вчера в 15:04", newsText: "Когда я в далеких 2000-ых шел учиться на повара, я примерно так себе представлял свою будущую профессию. Креатив, каждый день что-то новое и интересное. К сожалению реалии наши сильно отличаются. Зацените - ресторан с 2 звездами Мишлен! И здесь вам точно помидорку в кожуре не подадут (привет #Булгаков, единственное место где подают чищеные томаты)", newsImage: "News-1", viewsCounter: "42"),
        
        News(avatarPath: "user", username: "Никитин Евгений", newsTime: "Две минуты назад", newsText: "Любите развиваться? Конечно, поэтому я стараюсь вам подбрасывать то, что срезонировало у меня. В любой современной стране, понимание экономики - гражданский долг избирателя. Так что не пройдите мимо, и получи самые базовые (а главное - свежие) знания, чтобы быть ответственным гражданином своей страны (мы будущее этой страны и ее экономики). По ссылкам там есть и больше видео 🤙🏻", newsImage: "News-3", viewsCounter: "249"),
        
        News(avatarPath: "user", username: "Никитин Евгений", newsTime: "12 дек в 21:40", newsText: "Уже пять лет прошло", newsImage: "News-4", viewsCounter: "1249")
        ]
    }
}