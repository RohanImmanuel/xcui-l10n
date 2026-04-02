import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var settings: AppSettings

    var body: some View {
        Form {
            Section("section.appearance") {
                Toggle("toggle.dark_mode", isOn: $settings.darkModeEnabled)
                    .accessibilityIdentifier("toggle.dark_mode")

                Picker("picker.text_size", selection: $settings.textSizeIndex) {
                    Text("text_size.small").tag(0)
                    Text("text_size.medium").tag(1)
                    Text("text_size.large").tag(2)
                }
                .accessibilityIdentifier("picker.text_size")
            }

            Section("section.notifications") {
                Toggle("toggle.notifications", isOn: $settings.notificationsEnabled)
                    .accessibilityIdentifier("toggle.notifications")
            }

            Section("section.about") {
                LabeledContent("label.version", value: settings.appVersion)
                    .accessibilityIdentifier("label.version")
                LabeledContent("label.build", value: settings.buildNumber)
                    .accessibilityIdentifier("label.build")
            }
        }
        .navigationTitle("nav.title")
        .navigationBarTitleDisplayMode(.large)
    }
}
