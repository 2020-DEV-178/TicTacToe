import Foundation

enum MoveResult {
    case Authorized(player: Player)
    case Forbiden
    case Win(player: Player)
    case Draw(lastPlayer: Player)
}
