// User.swift
// Copyright © RoadMap. All rights reserved.

/// Модель для списка друзей
struct User {
    let avatarImageName: String
    let name: String
    let description: String?
}

/// Моки для друзей
struct Users {
    static func getUsers() -> [User] {
        [
            User(
                avatarImageName: "avatarWFour",
                name: "Лаврентьева Василиса",
                description: "БГПУ им. М. Акмуллы (бывш. БашГПИ)"
            ),
            User(
                avatarImageName: "avatarWOne",
                name: "Абрамова Виктория",
                description: nil
            ),
            User(
                avatarImageName: "avatarWThree",
                name: "Соколова Варвара",
                description: "МГУТУ (КФ)"
            ),
            User(
                avatarImageName: "avatarWTwo",
                name: "Федосеева Татьяна",
                description: nil
            ),
            User(
                avatarImageName: "avatarMOne",
                name: "Поляков Елисей",
                description: nil
            ),
            User(
                avatarImageName: "avatarMTwo",
                name: "Прокофьев Максим",
                description: nil
            ),
            User(
                avatarImageName: "avatarWOne",
                name: "Старостина Мария",
                description: "РЭУ им. Г. В. Плеханова"
            ),
            User(
                avatarImageName: "avatarWThree",
                name: "Галкина Антонина",
                description: "РГУП (бывш. РАП)"
            ),
            User(
                avatarImageName: "avatarMTwo",
                name: "Медведев Артём",
                description: "Москва"
            ),
            User(
                avatarImageName: "avatarMOne",
                name: "Смирнов Станислав",
                description: nil
            ),
            User(
                avatarImageName: "avatarWFour",
                name: "Дмитриева Мария",
                description: "РГУП (бывш. РАП)"
            ),
            User(
                avatarImageName: "avatarMTwo",
                name: "Демин Кирилл",
                description: nil
            ),
            User(
                avatarImageName: "avatarMOne",
                name: "Галкин Егор",
                description: nil
            ),
            User(
                avatarImageName: "avatarWOne",
                name: "Егорова Диана",
                description: "РЭУ им. Г. В. Плеханова"
            ),
            User(
                avatarImageName: "avatarWTwo",
                name: "Попова Ева",
                description: nil
            ),
            User(
                avatarImageName: "avatarMOne",
                name: "Романов Иван",
                description: "МАИ"
            ),
            User(
                avatarImageName: "avatarWThree",
                name: "Селезнева Ульяна",
                description: "РГУП (бывш. РАП)"
            ),
            User(
                avatarImageName: "avatarMTwo",
                name: "Гришин Андрей",
                description: "Волгоград"
            ),
            User(
                avatarImageName: "avatarWFour",
                name: "Галкина Варвара",
                description: "МАИ"
            ),
            User(
                avatarImageName: "avatarMOne",
                name: "Петровский Леонид",
                description: "РЭУ им. Г. В. Плеханова"
            ),
            User(
                avatarImageName: "avatarMTwo",
                name: "Лопатин Захар",
                description: "МАИ"
            ),
            User(
                avatarImageName: "avatarWFour",
                name: "Иванова Кира",
                description: nil
            ),
            User(
                avatarImageName: "avatarWThree",
                name: "Корнеева Зоя",
                description: "РГУП (бывш. РАП)"
            ),
            User(
                avatarImageName: "avatarWFour",
                name: "Федорова Элина",
                description: "МАИ"
            ),
        ]
    }
}
