import XCTest
@testable import TicTacToe

class TicTacToeWinnerValidatorTest: XCTestCase {

    let player1 = Player(name: "Player 1", image: UIImage())
    let player2 = Player(name: "Player 2", image: UIImage())
    
    func testEmptyBoard() {
        let board = [Location: Player]()
        let validator = TicTacToeWinnerValidator(game: board)
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .One)), "Has no player played, it should be false")
    }
    
    func testColumnAWinner() {
        let board = [Location(column: .A, row: .One): player1,
                     Location(column: .A, row: .Two): player1,
                     Location(column: .A, row: .Three): player1]
        let validator = TicTacToeWinnerValidator(game: board)
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .One)), "Player should win has column A is full with his moves")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .Two)), "Player should win has column A is full with his moves")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .Three)), "Player should win has column A is full with his moves")
    }
    
    func testColumnBWinner() {
        let board = [Location(column: .B, row: .One): player1,
                     Location(column: .B, row: .Two): player1,
                     Location(column: .B, row: .Three): player1]
        let validator = TicTacToeWinnerValidator(game: board)
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .One)), "Player should win has column B is full with his moves")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .Two)), "Player should win has column B is full with his moves")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .Three)), "Player should win has column B is full with his moves")
    }

    func testColumnCWinner() {
        let board = [Location(column: .C, row: .One): player1,
                     Location(column: .C, row: .Two): player1,
                     Location(column: .C, row: .Three): player1]
        let validator = TicTacToeWinnerValidator(game: board)
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .One)), "Player should win has column C is full with his moves")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .Two)), "Player should win has column C is full with his moves")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .Three)), "Player should win has column C is full with his moves")
    }
    
    func testRowOneWinner() {
        let board = [Location(column: .A, row: .One): player1,
                     Location(column: .B, row: .One): player1,
                     Location(column: .C, row: .One): player1]
        let validator = TicTacToeWinnerValidator(game: board)
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .One)), "Player should win has row 1 is full with his moves")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .One)), "Player should win has row 1 is full with his moves")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .One)), "Player should win has row 1 is full with his moves")
    }
    
    func testRowTwoWinner() {
        let board = [Location(column: .A, row: .Two): player1,
                     Location(column: .B, row: .Two): player1,
                     Location(column: .C, row: .Two): player1]
        let validator = TicTacToeWinnerValidator(game: board)
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .Two)), "Player should win has row 2 is full with his moves")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .Two)), "Player should win has row 2 is full with his moves")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .Two)), "Player should win has row 2 is full with his moves")
    }
    
    func testRowTowWinner() {
        let board = [Location(column: .A, row: .Three): player1,
                     Location(column: .B, row: .Three): player1,
                     Location(column: .C, row: .Three): player1]
        let validator = TicTacToeWinnerValidator(game: board)
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .Three)), "Player should win has row 3 is full with his moves")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .Three)), "Player should win has row 3 is full with his moves")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .Three)), "Player should win has row 3 is full with his moves")
    }
    
    func testTopToBottomDiagonalWinner() {
        let board = [Location(column: .A, row: .One): player1,
                     Location(column: .B, row: .Two): player1,
                     Location(column: .C, row: .Three): player1]
        let validator = TicTacToeWinnerValidator(game: board)
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .One)), "Player should win has Top to bottom diagonal is full with his moves")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .Two)), "Player should win has Top to bottom diagonal is full with his moves")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .Three)), "Player should win has Top to bottom diagonal is full with his moves")
    }
    
    func testBottomToTopDiagonalWinner() {
        let board = [Location(column: .A, row: .Three): player1,
                     Location(column: .B, row: .Two): player1,
                     Location(column: .C, row: .One): player1]
        let validator = TicTacToeWinnerValidator(game: board)
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .Three)), "Player should win has bottom to top diagonal is full with his moves")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .Two)), "Player should win has bottom to top diagonal is full with his moves")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .One)), "Player should win has bottom to top diagonal is full with his moves")
    }
    
    func testColumnCNoWinner() {
        let board = [Location(column: .C, row: .One): player1,
                     Location(column: .C, row: .Two): player2,
                     Location(column: .C, row: .Three): player1]
        let validator = TicTacToeWinnerValidator(game: board)
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .One)), "Player should not win has column C is not full with his moves")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .Two)), "Player should not win has column C is not full with his moves")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .Three)), "Player should not win has column C is not full with his moves")
    }
    
    func testColumnANoWinner() {
        let board = [Location(column: .A, row: .One): player1,
                     Location(column: .A, row: .Two): player1,
                     Location(column: .A, row: .Three): player2]
        let validator = TicTacToeWinnerValidator(game: board)
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .One)), "Player should not win has column A is not full with his moves")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .Two)), "Player should not win has column A is not full with his moves")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .Three)), "Player should not win has column A is not full with his moves")
    }
    
    func testColumnBNoWinner() {
        let board = [Location(column: .B, row: .One): player2,
                     Location(column: .B, row: .Two): player1,
                     Location(column: .B, row: .Three): player2]
        let validator = TicTacToeWinnerValidator(game: board)
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .One)), "Player should not win has column B is not full with his moves")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .Two)), "Player should not win has column B is not full with his moves")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .Three)), "Player should not win has column B is not full with his moves")
    }
    
    func testRowOneNoWinner() {
        let board = [Location(column: .A, row: .One): player1,
                     Location(column: .B, row: .Two): player2,
                     Location(column: .C, row: .Three): player1]
        let validator = TicTacToeWinnerValidator(game: board)
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .One)), "Player should not win has row 1 is not full with his moves")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .One)), "Player should not win has row 1 is not full with his movess")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .One)), "Player should not win has row 1 is not full with his moves")
    }
    
    func testRowTwoNoWinner() {
        let board = [Location(column: .A, row: .Two): player1,
                     Location(column: .B, row: .Two): player2,
                     Location(column: .C, row: .Two): player1]
        let validator = TicTacToeWinnerValidator(game: board)
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .Two)), "Player should not win has row 2 is not full with his moves")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .Two)), "Player should not win has row 2 is not full with his movess")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .Two)), "Player should not win has row 2 is not full with his moves")
    }
    
    func testRowThreeNoWinner() {
        let board = [Location(column: .A, row: .Three): player1,
                     Location(column: .B, row: .Three): player2,
                     Location(column: .C, row: .Three): player1]
        let validator = TicTacToeWinnerValidator(game: board)
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .Three)), "Player should not win has row 3 is not full with his moves")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .Three)), "Player should not win has row 3 is not full with his movess")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .Three)), "Player should not win has row 3 is not full with his moves")
    }
    
    func testTopToBottomDiagonalNoWinner() {
        let board = [Location(column: .A, row: .One): player1,
                     Location(column: .B, row: .Two): player2,
                     Location(column: .C, row: .Three): player1]
        let validator = TicTacToeWinnerValidator(game: board)
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .One)), "Player should not win has Top to bottom diagonal is not full with his moves")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .Two)), "Player should not win has Top to bottom diagonal is not full with his moves")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .Three)), "Player should not win has Top to bottom diagonal is not full with his moves")
    }
    
    func testBottomToTopDiagonalNoWinner() {
        let board = [Location(column: .A, row: .Three): player1,
                     Location(column: .B, row: .Two): player1,
                     Location(column: .C, row: .One): player2]
        let validator = TicTacToeWinnerValidator(game: board)
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .Three)), "Player should not win has bottom to top diagonal is not full with his moves")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .Two)), "Player should not win has bottom to top diagonal is not full with his moves")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .One)), "Player should not win has bottom to top diagonal is not full with his moves")
    }
    
    func testTopToBottomDiagonalWinnerFullBoard() {
        let board = [Location(column: .A, row: .One): player1,
                     Location(column: .A, row: .Two): player1,
                     Location(column: .A, row: .Three): player2,
                     Location(column: .B, row: .One): player1,
                     Location(column: .B, row: .Two): player1,
                     Location(column: .B, row: .Three): player2,
                     Location(column: .C, row: .One): player2,
                     Location(column: .C, row: .Two): player2,
                     Location(column: .C, row: .Three): player1]
        let validator = TicTacToeWinnerValidator(game: board)
        
    
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .One)), "Player should win")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .Two)), "Player should not win")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .Three)), "Player should not win")
        
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .One)), "Player should not win")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .Two)), "Player should win")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .Three)), "Player should not win")
        
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .One)), "Player should not win")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .Two)), "Player should not win")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .Three)), "Player should win")
    }
    
    func testBottomToTopWinnerFullBoard() {
        let board = [Location(column: .A, row: .One): player1,
                     Location(column: .A, row: .Two): player1,
                     Location(column: .A, row: .Three): player2,
                     Location(column: .B, row: .One): player1,
                     Location(column: .B, row: .Two): player2,
                     Location(column: .B, row: .Three): player1,
                     Location(column: .C, row: .One): player2,
                     Location(column: .C, row: .Two): player2,
                     Location(column: .C, row: .Three): player1]
        let validator = TicTacToeWinnerValidator(game: board)
        
    
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .One)), "Player should not win")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .Two)), "Player should not win has column A is not full with his moves")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .Three)), "Player should win")
        
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .One)), "Player should not win")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .Two)), "Player should not win")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .Three)), "Player should win")
        
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .One)), "Player should not win")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .Two)), "Player should not win")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .Three)), "Player should win")
    }
    
    func testNotWinnerFullBoard() {
        let board = [Location(column: .A, row: .One): player2,
                     Location(column: .A, row: .Two): player1,
                     Location(column: .A, row: .Three): player2,
                     Location(column: .B, row: .One): player1,
                     Location(column: .B, row: .Two): player2,
                     Location(column: .B, row: .Three): player1,
                     Location(column: .C, row: .One): player2,
                     Location(column: .C, row: .Two): player2,
                     Location(column: .C, row: .Three): player1]
        let validator = TicTacToeWinnerValidator(game: board)
        
    
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .One)), "Player should not win")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .Two)), "Player should not win has column A is not full with his moves")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .A, row: .Three)), "Player should win")
        
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .One)), "Player should not win")
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .Two)), "Player should not win")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .B, row: .Three)), "Player should win")
        
        XCTAssertTrue(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .One)), "Player should not win")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .Two)), "Player should not win")
        XCTAssertFalse(validator.verifyIfPlayerHasWon(from: .init(column: .C, row: .Three)), "Player should win")
    }
}
