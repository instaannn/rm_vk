// User.swift
// Copyright © RoadMap. All rights reserved.

/// Пользователь
struct User {
    let avatarImageName: String
    let name: String
    let description: String?
    let photosImageNames: [String]?
}

/// Моки для друзей
struct Users {
    static func getUsers() -> [User] {
        [
            User(
                avatarImageName: "avatarWFour",
                name: "Лаврентьева Василиса",
                description: "БГПУ им. М. Акмуллы (бывш. БашГПИ)",
                photosImageNames: [
                    "avatarWFour",
                    "avatarWOne",
                    "avatarWThree",
                    "avatarWFour",
                    "avatarWOne",
                    "avatarWThree"
                ]
            ),
            User(
                avatarImageName: "avatarWOne",
                name: "Абрамова Виктория",
                description: nil,
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarWThree",
                name: "Соколова Варвара",
                description: "МГУТУ (КФ)",
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarWTwo",
                name: "Федосеева Татьяна",
                description: nil,
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarMOne",
                name: "Поляков Елисей",
                description: nil,
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarMTwo",
                name: "Прокофьев Максим",
                description: nil,
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarWOne",
                name: "Старостина Мария",
                description: "РЭУ им. Г. В. Плеханова",
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarWThree",
                name: "Галкина Антонина",
                description: "РГУП (бывш. РАП)",
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarMTwo",
                name: "Медведев Артём",
                description: "Москва",
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarMOne",
                name: "Смирнов Станислав",
                description: nil,
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarWFour",
                name: "Дмитриева Мария",
                description: "РГУП (бывш. РАП)",
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarMTwo",
                name: "Демин Кирилл",
                description: nil,
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarMOne",
                name: "Галкин Егор",
                description: nil,
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarWOne",
                name: "Егорова Диана",
                description: "РЭУ им. Г. В. Плеханова",
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarWTwo",
                name: "Попова Ева",
                description: nil,
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarMOne",
                name: "Романов Иван",
                description: "МАИ",
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarWThree",
                name: "Селезнева Ульяна",
                description: "РГУП (бывш. РАП)",
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarMTwo",
                name: "Гришин Андрей",
                description: "Волгоград",
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarWFour",
                name: "Галкина Варвара",
                description: "МАИ",
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarMOne",
                name: "Петровский Леонид",
                description: "РЭУ им. Г. В. Плеханова",
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarMTwo",
                name: "Лопатин Захар",
                description: "МАИ",
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarWFour",
                name: "Иванова Кира",
                description: nil,
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarWThree",
                name: "Корнеева Зоя",
                description: "РГУП (бывш. РАП)",
                photosImageNames: ["avatarWFour"]
            ),
            User(
                avatarImageName: "avatarWFour",
                name: "Федорова Элина",
                description: "МАИ",
                photosImageNames: ["avatarWFour"]
            ),
        ]
    }
}
