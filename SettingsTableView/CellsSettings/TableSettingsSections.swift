import UIKit

struct Section {
    let title: String
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
}

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    var isOn: Bool
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

extension Section {
    static func getSections() -> [Section] {
        return [
            // 1st section
            Section(title: "", options: [
                .switchCell(model: SettingsSwitchOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
                    print("Нажата ячейка Авиарежим")
                }, isOn: false)),
                .staticCell(model: SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemBlue) {
                    print("Нажата ячейка Wi-Fi")
                }),
                .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "iphone.homebutton.radiowaves.left.and.right"), iconBackgroundColor: .systemBlue, handler: {
                    print("Нажата ячейка Bluetooth")
                })),
                .staticCell(model: SettingsOption(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen) {
                    print("Нажата ячейка Сотовая связь")
                }),
                .staticCell(model: SettingsOption(title: "Режим модема", icon: UIImage(systemName: "personalhotspot"), iconBackgroundColor: .systemGreen) {
                    print("Нажата ячейка Режим модема")
                }),
                .switchCell(model: SettingsSwitchOption(title: "VPN", icon: UIImage(systemName: "paperplane.fill"), iconBackgroundColor: .systemBlue, handler: {
                    print("Нажата ячейка VPN")
                }, isOn: false)),
            ]),
                
            // 2nd section
            Section(title: "", options: [
                .staticCell(model: SettingsOption(title: "Уведомления", icon: UIImage(systemName: "app.badge"), iconBackgroundColor: .systemRed) {
                    print("Нажата ячейка Уведомления")
                }),
                .staticCell(model: SettingsOption(title: "Звуки, тактильные сигналы", icon: UIImage(systemName: "volume.3.fill"), iconBackgroundColor: .systemPink) {
                    print("Нажата ячейка Звуки, тактильные сигналы")
                }),
                .staticCell(model: SettingsOption(title: "Не беспокоить", icon: UIImage(systemName: "moon.fill"), iconBackgroundColor: .systemPurple) {
                    print("Нажата ячейка Не беспокоить")
                }),
                .staticCell(model: SettingsOption(title: "Экранное время", icon: UIImage(systemName: "hourglass"), iconBackgroundColor: .systemPurple) {
                    print("Нажата ячейка Экранное время")
                })
            ]),
            
            // 3rd section
            Section(title: "", options: [
                .staticCell(model: SettingsOption(title: "Основные", icon: UIImage(systemName: "gear"), iconBackgroundColor: .systemGray) {
                    print("Нажата ячейка Основные")
                }),
                .staticCell(model: SettingsOption(title: "Пункт управления", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemGray) {
                    print("Нажата ячейка Пункт управления")
                }),
                .staticCell(model: SettingsOption(title: "Экран и яркость", icon: UIImage(systemName: "textformat.size"), iconBackgroundColor: .systemBlue) {
                    print("Нажата ячейка Экран и яркость")
                }),
                .staticCell(model: SettingsOption(title: "Экран \"Домой\"", icon: UIImage(systemName: "homekit"), iconBackgroundColor: .purple) {
                    print("Нажата ячейка Экран \"Домой\"")
                }),
                .staticCell(model: SettingsOption(title: "Универсальный доступ", icon: UIImage(systemName: "figure.stand"), iconBackgroundColor: .systemBlue) {
                    print("Нажата ячейка Универсальный доступ")
                })
            ])
            ]
    }
}
