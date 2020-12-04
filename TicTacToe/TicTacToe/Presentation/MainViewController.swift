import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var playerLabel: UILabel! {
        didSet {
            playerLabel.text = ""
        }
    }
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var restartButton: UIButton! {
        didSet {
            restartButton.setTitle("restart".localized, for: .normal)
            restartButton.addTarget(self, action: #selector(onRestartPressed), for: .primaryActionTriggered)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @objc func onRestartPressed() {
        
    }

}

extension String {
    
    var localized: String {
        get { NSLocalizedString(self, comment: "") }
    }
}
