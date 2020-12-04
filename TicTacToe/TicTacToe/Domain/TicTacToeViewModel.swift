import Foundation

typealias Game = [Location: Player?]

class TicTacToeViewModel {
    
    private let player1: Player
    private let player2: Player
    
    private var currentPlayer: Player
    
    private var game = Game()
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
        
        self.currentPlayer = player1
    }
    
    public func moveMade(at location: Location) -> MoveResult {
        return MoveResult.Authorized(player: currentPlayer)
    }
    
}
