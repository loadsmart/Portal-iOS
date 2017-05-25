import Foundation

public final class EnvironmentDispatcher {

    public var storage: UserDefaults
    private static let storageKey = "Portal.EnvironmentDispatcher.currentEnvironmentIdentifier"

    public static let shared = EnvironmentDispatcher()

    public init(storage: UserDefaults = .standard) {
        self.storage = storage
    }

    public var currentEnvironmentIdentifier: String? {
        get {
            return storage.value(forKey: EnvironmentDispatcher.storageKey) as? String
        }

        set {
            storage.set(newValue, forKey: EnvironmentDispatcher.storageKey)
            storage.synchronize()
        }
    }
}
