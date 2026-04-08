import XCTest

class LocalizationTestCase: XCTestCase {
    var app: XCUIApplication!

    var locale: String { "en" }
    var region: String { "US" }

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments += [
            "-AppleLanguages", "(\(locale))",
            "-AppleLocale",    "\(locale)_\(region)"
        ]
        app.launch()
    }

    override func tearDown() {
        app.terminate()
        super.tearDown()
    }

    func waitFor(_ element: XCUIElement, timeout: TimeInterval = 5) {
        XCTAssertTrue(element.waitForExistence(timeout: timeout))
    }
}

class SettingsLocalizationEnglishTests: LocalizationTestCase {
    func testNavigationTitle() {
        waitFor(app.navigationBars["Settings"])
    }

    func testSectionHeaders() {
        waitFor(app.staticTexts["Appearance"])
        waitFor(app.staticTexts["Notifications"])
        waitFor(app.staticTexts["About"])
    }

    func testToggleLabels() {
        waitFor(app.switches["Dark Mode"])
        waitFor(app.switches["Enable Notifications"])
    }

    func testPickerLabel() {
        waitFor(app.staticTexts["Text Size"])
    }

    func testAboutRowLabels() {
        waitFor(app.staticTexts["Version"])
        waitFor(app.staticTexts["Build"])
    }
}

class SettingsLocalizationSpanishTests: LocalizationTestCase {
    override var locale: String { "es" }
    override var region: String { "ES" }

    func testNavigationTitle() {
        waitFor(app.navigationBars["Ajustes"])
    }

    func testSectionHeaders() {
        waitFor(app.staticTexts["Apariencia"])
        waitFor(app.staticTexts["Notificaciones"])
        waitFor(app.staticTexts["Acerca de"])
    }

    func testToggleLabels() {
        waitFor(app.switches["Modo oscuro"])
        waitFor(app.switches["Activar notificaciones"])
    }

    func testPickerLabel() {
        waitFor(app.staticTexts["Tamaño del texto"])
    }

    func testAboutRowLabels() {
        waitFor(app.staticTexts["Versión"])
        waitFor(app.staticTexts["Compilación"])
    }
}

class SettingsLocalizationFrenchTests: LocalizationTestCase {
    override var locale: String { "fr" }
    override var region: String { "FR" }

    func testNavigationTitle() {
        waitFor(app.navigationBars["Réglages"])
    }

    func testSectionHeaders() {
        waitFor(app.staticTexts["Apparence"])
        waitFor(app.staticTexts["Notifications"])
        waitFor(app.staticTexts["À propos"])
    }

    func testToggleLabels() {
        waitFor(app.switches["Mode sombre"])
        waitFor(app.switches["Activer les notifications"])
    }

    func testPickerLabel() {
        waitFor(app.staticTexts["Taille du texte"])
    }

    func testAboutRowLabels() {
        waitFor(app.staticTexts["Version"])
        waitFor(app.staticTexts["Build"])
    }
}
