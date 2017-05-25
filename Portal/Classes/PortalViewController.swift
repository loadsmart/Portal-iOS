import UIKit

public final class PortalViewController: UITableViewController {

    public let dispatcher: EnvironmentDispatcher
    public let environments: [Environment]

    public weak var delegate: PortalViewControllerDelegate?

    public init(environments: [Environment],
                dispatcher: EnvironmentDispatcher = EnvironmentDispatcher()) {
        self.environments = environments
        self.dispatcher = dispatcher
        super.init(style: .grouped)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Choose your environment"
    }

    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return environments.count
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Environment") else {
            let defaultCell = UITableViewCell(style: .value1, reuseIdentifier: "Environment")
            configure(cell: defaultCell, indexPath: indexPath)
            return defaultCell
        }

        configure(cell: cell, indexPath: indexPath)
        return cell
    }

    private func configure(cell: UITableViewCell, indexPath: IndexPath) {
        cell.textLabel?.text = environments[indexPath.row].name
        cell.detailTextLabel?.text = environments[indexPath.row].url.absoluteString
    }

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let env = environments[indexPath.row]
        dispatcher.currentEnvironmentIdentifier = env.identifier
        delegate?.portalDidSelect(environment: env)
    }
}

public protocol PortalViewControllerDelegate: class {
    func portalDidSelect(environment: Environment)
}
