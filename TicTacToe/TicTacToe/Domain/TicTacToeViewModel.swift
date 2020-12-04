import Foundation

typealias Game = [Location: Player?]

class TicTacToeViewModel {
    
    private enum MagicNumbers {
        static let maxMoveNumber = 9
    }
    
    private let player1: Player
    private let player2: Player
    
    private var currentPlayer: Player
    
    private var moveCounter: Int = 0
    
    private var game = Game()
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
        
        self.currentPlayer = player1
    }
    
    public func moveMade(at location: Location) -> MoveResult {
        let player = currentPlayer
        guard game[location] == nil else {
            return .Forbiden
        }
        game[location] = currentPlayer
        moveCounter += 1
        if isAWin(from: location) {
            return .Win(player: player)
        } else if moveCounter == MagicNumbers.maxMoveNumber {
            return .Draw
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
    }
    
    func isAWin(from location: Location) -> Bool {
        return false
    }
}
