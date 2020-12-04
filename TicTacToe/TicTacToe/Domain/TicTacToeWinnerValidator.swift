import Foundation

class TicTacToeWinnerValidator{
    
    let game: [Location: Player?]
    
    init(game: [Location: Player?]) {
        self.game = game
    }
    
    func verifyIfPlayerHasWon(from location: Location) -> Bool {
        guard let player = game[location] else { return false }
        return createLocations(from: location)
            .map { $0.values.map { game[$0] == player } }
            .map { $0.isWinning() }
            .contains(true)
    }
    
    private func createLocations(from location: Location) -> [Direction] {
        var directions = [Direction(values: createColumsLocation(for: location.column)),
                          Direction(values: createRowLocations(for: location.row))]
        
        switch (location.column, location.row) {
            case (.A, .One), (.C, .Three): directions.append(.init(values: createTopToBottomDiagonals()))
            case (.A, .Three), (.C, .One): directions.append(.init(values: createBottomToTopDiagonals()))
            case (.B, .Two): directions.append(contentsOf: [.init(values: createTopToBottomDiagonals()), .init(values: createBottomToTopDiagonals())])
            default: break
        }
        return directions
    }
    
    private struct Direction {
        let values : [Location]
    }
    
    private func createColumsLocation(for column: Column) -> [Location]  {
        return [.init(column: column, row: .One), .init(column: column, row: .Two), .init(column: column, row: .Three)]
    }
    
    private func createRowLocations(for row: Row) -> [Location]  {
        return [.init(column: .A, row: row), .init(column: .B, row: row), .init(column: .C, row: row)]
    }
    
    private func createTopToBottomDiagonals() -> [Location] {
        return [.init(column: .A, row: .One), .init(column: .B, row: .Two), .init(column: .C, row: .Three)]
    }
    private func createBottomToTopDiagonals() -> [Location] {
        return [.init(column: .A, row: .Three), .init(column: .B, row: .Two), .init(column: .C, row: .One)]
    }
}

private extension Array where Element == Bool {
    func isWinning() -> Bool {
        return reduce(true) { $0 && $1 }
    }
}
