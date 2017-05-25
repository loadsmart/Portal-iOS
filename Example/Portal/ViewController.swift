import UIKit
import Portal

class ViewController: UIViewController, PortalViewControllerDelegate {

    let dispatcher = EnvironmentDispatcher()

    @IBOutlet weak var currentEnvLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        currentEnvLabel.text = dispatcher.currentEnvironment?.name
    }

    @IBAction func selectEnvButtonTapped(_ sender: Any) {
        let envs: [MyAPIEnvironment] = [.local, .staging, .production]
        let portalViewController = PortalViewController(environments: envs,
                                                     dispatcher: dispatcher)
        portalViewController.delegate = self
        navigationController?.pushViewController(portalViewController, animated: true)
    }

    func portalDidSelect(environment: Environment) {
        currentEnvLabel.text = dispatcher.currentEnvironment?.name
        navigationController?.popViewController(animated: true)
    }
}
