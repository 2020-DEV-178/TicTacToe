import Foundation

protocol TicTacToeViewListener: class {
    func userSelected(column: Column, row: Row) -> MoveResult
}
