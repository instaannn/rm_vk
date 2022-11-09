// Group.swift
// Copyright © RoadMap. All rights reserved.

/// Группа
struct Group {
    let avatarImageName: String
    let title: String
    let description: String?
}

/// Моки для групп
struct Groups {
    static func getGroups() -> [Group] {
        [
            Group(
                avatarImageName: "liza",
                title: "Клуб лизы",
                description: "Отличники"
            ),
            Group(
                avatarImageName: "groupAvatarOne",
                title: "Парк горького",
                description: "Парк культуры и отдыха"
            ),
            Group(
                avatarImageName: "maggie",
                title: "Агу",
                description: nil
            ),
            Group(
                avatarImageName: "bart",
                title: "Карамба",
                description: nil
            ),
            Group(
                avatarImageName: "groupAvatarThree",
                title: "Кубик в кубе",
                description: "Студия"
            ),
            Group(
                avatarImageName: "groupAvatarTwo",
                title: "Музей-заповедник «Царицыно»",
                description: "Парк"
            )
        ]
    }
}
