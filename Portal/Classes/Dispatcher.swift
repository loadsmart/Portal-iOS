import Foundation

public final class Dispatcher {

    public var storage: UserDefaults
    private static let storageKey = "Portal.Dispatcher.currentEnvironmentIdentifier"

    public static let shared = Dispatcher()

    public init(storage: UserDefaults = .standard) {
        self.storage = storage
    }

    public var currentEnvironmentIdentifier: String? {
        get {
            return storage.value(forKey: Dispatcher.storageKey) as? String
        }

        set {
            storage.set(newValue, forKey: Dispatcher.storageKey)
            storage.synchronize()
        }
    }
}
