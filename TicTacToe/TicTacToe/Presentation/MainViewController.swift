import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var ticTacToeView: TicTacToeView!
    @IBOutlet weak var restartButton: UIButton! {
        didSet {
            restartButton.setTitle("restart".localized, for: .normal)
            restartButton.addTarget(self, action: #selector(onRestartPressed), for: .primaryActionTriggered)
        }
    }
    
    private let viewModel = TicTacToeViewModel(player1: Player(name: "player_one_name".localized, image: UIImage(named: "ic_cross")!),
                                               player2: Player(name: "player_two_name".localized, image: UIImage(named: "ic_round")!))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.startGame()
        updatePlayerInfo()
        ticTacToeView.listener = self
    }
    
    func updatePlayerInfo() {
        playerImage.image = viewModel.currentPlayer.image
        playerLabel.text = viewModel.currentPlayer.name
    }

    @objc func onRestartPressed() {
        viewModel.startGame()
        ticTacToeView.clearBoard()
        updatePlayerInfo()
    }

    private func gameDraw() {
        let alertController = UIAlertController(title: "alert.draw.title".localized, message: "alert.draw.message".localized, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "restart".localized, style: .default, handler: { [weak self] _ in
            self?.onRestartPressed()
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    private func gameHasWinner(player: Player) {
        let alertController = UIAlertController(title: "alert.winner.title".localized, message: String(format: "alert.winner.message".localized, player.name), preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "restart".localized, style: .default, handler: { [weak self] _ in
            self?.onRestartPressed()
        }))
        present(alertController, animated: true, completion: nil)
    }
}

extension MainViewController: TicTacToeViewListener {
    
    func userSelected(column: Column, row: Row) -> MoveResult {
        let result = viewModel.moveMade(at: Location(column: column, row: row))
        
        switch result {
        case .Authorized:
            updatePlayerInfo()
        case .Draw:
            gameDraw()
        case .Win(let player):
            gameHasWinner(player: player)
        default:
            break
        }
        return result
    }
}

extension String {
    
    var localized: String {
        get { NSLocalizedString(self, comment: "") }
    }
}
