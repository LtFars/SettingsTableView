import UIKit

struct Section {
    let title: String
    let options: [SettingsOption]
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let tableView: UITableView = {
        var table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Настройки"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func configure() {
        
        // 1st section
        models.append(Section(title: "", options: [
            SettingsOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange) {
                print("Нажата ячейка Авиарежим")
            },
            SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemBlue) {
                print("Нажата ячейка Wi-Fi")
            },
            SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .systemBlue) {
                print("Нажата ячейка Bluetooth")
            },
            SettingsOption(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen) {
                print("Нажата ячейка Сотовая связь")
            },
            SettingsOption(title: "Режим модема", icon: UIImage(systemName: "personalhotspot"), iconBackgroundColor: .systemGreen) {
                print("Нажата ячейка Режим модема")
            },
            SettingsOption(title: "VPN", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemBlue) {
                print("Нажата ячейка VPN")
            }
        ]))
        
        // 2nd section
        models.append(Section(title: "", options: [
            SettingsOption(title: "Уведомления", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemRed) {
                print("Нажата ячейка Уведомления")
            },
            SettingsOption(title: "Звуки, тактильные сигналы", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print("Нажата ячейка Звуки, тактильные сигналы")
            },
            SettingsOption(title: "Не беспокоить", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPurple) {
                print("Нажата ячейка Не беспокоить")
            },
            SettingsOption(title: "Экранное время", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPurple) {
                print("Нажата ячейка Экранное время")
            }
        ]))
        
        // 3rd section
        models.append(Section(title: "", options: [
            SettingsOption(title: "Основные", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGray) {
                print("Нажата ячейка Основные")
            },
            SettingsOption(title: "Пункт управления", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemGray) {
                print("Нажата ячейка Пункт управления")
            },
            SettingsOption(title: "Экран и яркость", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemBlue) {
                print("Нажата ячейка Экран и яркость")
            },
            SettingsOption(title: "Экран \"Домой\"", icon: UIImage(systemName: "house"), iconBackgroundColor: .purple) {
                print("Нажата ячейка Экран \"Домой\"")
            },
            SettingsOption(title: "Универсальный доступ", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemBlue) {
                print("Нажата ячейка Универсальный доступ")
            }
        ]))
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    var models = [Section]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
        model.handler()
    }
}
