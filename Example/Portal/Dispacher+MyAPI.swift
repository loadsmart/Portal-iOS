import Foundation
import Portal

extension EnvironmentDispatcher {
    var currentEnvironment: MyAPIEnvironment? {
        guard let identifier = currentEnvironmentIdentifier else {
            return nil
        }

        return MyAPIEnvironment(rawValue: identifier)
    }
}

enum MyAPIEnvironment: String, Environment {
    case local
    case staging
    case production

    var identifier: String {
        return rawValue
    }

    var name: String {
        switch self {
        case .local: return "Local"
        case .staging: return "Staging"
        case .production: return "Production"
        }
    }

    var url: URL {
        switch self {
        case .local: return URL(string: "http://0.0.0.0:3000")!
        case .staging: return URL(string: "http://staging.api.myapi.com")!
        case .production: return URL(string: "http://api.myapi.com")!
        }
    }
}
