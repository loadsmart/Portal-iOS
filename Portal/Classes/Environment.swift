import Foundation

public protocol Environment {
    var identifier: String { get }
    var name: String { get }
    var url: URL { get }
}
