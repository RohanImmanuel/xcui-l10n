import Combine
import Foundation

@MainActor
final class AppSettings: ObservableObject {
    @Published var notificationsEnabled: Bool {
        didSet { UserDefaults.standard.set(notificationsEnabled, forKey: Keys.notifications) }
    }
    @Published var darkModeEnabled: Bool {
        didSet { UserDefaults.standard.set(darkModeEnabled, forKey: Keys.darkMode) }
    }
    @Published var textSizeIndex: Int {
        didSet { UserDefaults.standard.set(textSizeIndex, forKey: Keys.textSize) }
    }

    let appVersion: String
    let buildNumber: String

    init() {
        notificationsEnabled = UserDefaults.standard.bool(forKey: Keys.notifications)
        darkModeEnabled      = UserDefaults.standard.bool(forKey: Keys.darkMode)
        textSizeIndex        = UserDefaults.standard.integer(forKey: Keys.textSize)
        appVersion           = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "—"
        buildNumber          = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "—"
    }

    private enum Keys {
        static let notifications = "pref_notifications"
        static let darkMode      = "pref_dark_mode"
        static let textSize      = "pref_text_size"
    }
}
