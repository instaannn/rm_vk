// News.swift
// Copyright © RoadMap. All rights reserved.

/// Модель новости
struct News {
    let avatarImageName: String
    let title: String
    let timeSubtitle: String
    let description: String
    let postImageName: String
    let views: String
}

/// Моки для новостей
struct AllNews {
    static func getNews() -> [News] {
        [
            News(
                avatarImageName: "groupAvatarOne",
                title: "Парк Горького",
                timeSubtitle: "30 минут назад",
                description: """
                Звуки идеального осеннего вечера: шорох опавших парковых листьев, \
                отдаленный шум города и смех близкого человека❤\nПриятного вечера, друзья!
                """,
                postImageName: "parkPost",
                views: "3,3K"
            ),
            News(
                avatarImageName: "groupAvatarTwo",
                title: "Музей-заповедник «Царицыно»",
                timeSubtitle: "вчера в 14:39",
                description: """
                Не пропустите завтрашнюю авторскую экскурсию «От археологии к реставрации» \
                со старшим научным сотрудником научно-исследовательского отдела, кандидатом \
                искусствоведения Павлом Ермоловым. Прогуляемся по дворцовой территории и Большому дворцу.
                """,
                postImageName: "parkPostTwo",
                views: "1,5K"
            ),
            News(
                avatarImageName: "groupAvatarThree",
                title: "Кубик в кубе - официальная группа",
                timeSubtitle: "5 ноя в 11:00",
                description: """
                Безрассудная молодость дворецкого Бэтмена. Шпионский триллер в традициях бондианы

                Альфред Пенниуорт — отставной офицер британского спецназа, который создаёт в Лондоне \
                собственное охранное предприятие. Одним из его первых клиентов становится миллионер \
                Томас Уэйн, отец будущего Бэтмена.
                """,
                postImageName: "postThree",
                views: "32K"
            )
        ]
    }
}
