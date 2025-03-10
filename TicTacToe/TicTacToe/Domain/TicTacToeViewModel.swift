import Foundation

typealias Board = [Location: Player?]

class TicTacToeViewModel {
    
    private enum MagicNumbers {
        static let maxMoveNumber = 9
    }
    
    private let player1: Player
    private let player2: Player
    
    var currentPlayer: Player
    
    private var moveCounter: Int = 0
    
    private var board = Board()
    private lazy var winnerValidator = TicTacToeWinnerValidator()
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
        self.currentPlayer = player1
    }
    
    public func startGame() {
        board.removeAll()
        moveCounter = 0
        currentPlayer = player1
    }
    
    public func moveMade(at location: Location) -> MoveResult {
        let player = currentPlayer
        guard board[location] == nil else {
            return .Forbiden
        }
        board[location] = currentPlayer
        moveCounter += 1
        if winnerValidator.verifyIfPlayerHasWon(from: location, in: board) {
            return .Win(player: player)
        } else if moveCounter == MagicNumbers.maxMoveNumber {
            return .Draw(lastPlayer: player)
        }
        moveToNexPlayer()
        return .Authorized(player: player)
    }
    
    private func moveToNexPlayer() {
        if currentPlayer == player1 {
            currentPlayer = player2
        } else {
            currentPlayer = player1
        }
    }}
