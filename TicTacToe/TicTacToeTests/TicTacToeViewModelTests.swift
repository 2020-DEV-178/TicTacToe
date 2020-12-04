import XCTest
@testable import TicTacToe

class TicTacToeViewModelTests: XCTestCase {
    let player1 = Player(name: "Player 1", image: UIImage())
    let player2 = Player(name: "Player 2", image: UIImage())

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    

    func testPlayerMove() throws {
        let viewModel = TicTacToeViewModel(player1: player1, player2: player2)
        let moveResult = viewModel.moveMade(at: Location(column: .A, row: .One))
        guard case let .Authorized(player) = moveResult else {
            XCTFail("This move should be authorized")
            exit(-1)
        }
        XCTAssert(player == player1)
    }
    
    func testPlayerTowMoves() throws {
        let viewModel = TicTacToeViewModel(player1: player1, player2: player2)
        _ = viewModel.moveMade(at: Location(column: .A, row: .One))
        let moveResult = viewModel.moveMade(at: Location(column: .A, row: .Two))
        guard case let .Authorized(player) = moveResult else {
            XCTFail("This move should be authorized")
            exit(-1)
        }
        XCTAssert(player == player2)
    }
    
    func testPlayerMoveToOccupiedCase() throws {
        let viewModel = TicTacToeViewModel(player1: player1, player2: player2)
        _ = viewModel.moveMade(at: Location(column: .A, row: .One))
        let moveResult = viewModel.moveMade(at: Location(column: .A, row: .One))
        guard case .Forbiden = moveResult else {
            XCTFail("This move should be Forbiden has an other player already use that location")
            exit(-1)
        }
    }
    
    func testPlayerMoveToOccupiedCaseAndMoveAgain() throws {
        let viewModel = TicTacToeViewModel(player1: player1, player2: player2)
        _ = viewModel.moveMade(at: Location(column: .A, row: .One))
        _ = viewModel.moveMade(at: Location(column: .A, row: .One))
        let moveResult = viewModel.moveMade(at: Location(column: .A, row: .Two))
        guard case let .Authorized(player) = moveResult else {
            XCTFail("This move should be authorized")
            exit(-1)
        }
        XCTAssert(player == player2)
    }
    
    
    func testGameDraw() throws {
        let viewModel = TicTacToeViewModel(player1: player1, player2: player2)
        _ = viewModel.moveMade(at: Location(column: .A, row: .One))
        _ = viewModel.moveMade(at: Location(column: .A, row: .Three))
        _ = viewModel.moveMade(at: Location(column: .A, row: .Two))
        _ = viewModel.moveMade(at: Location(column: .B, row: .One))
        _ = viewModel.moveMade(at: Location(column: .B, row: .Three))
        _ = viewModel.moveMade(at: Location(column: .B, row: .Two))
        _ = viewModel.moveMade(at: Location(column: .C, row: .One))
        _ = viewModel.moveMade(at: Location(column: .C, row: .Two))
        let moveResult = viewModel.moveMade(at: Location(column: .C, row: .Three))
        guard case .Draw = moveResult else {
            XCTFail("The game should be full without a winner")
            exit(-1)
        }
    }
    
    func testPlayer1WinHorizontally() throws {
        let viewModel = TicTacToeViewModel(player1: player1, player2: player2)
        _ = viewModel.moveMade(at: Location(column: .A, row: .One))
        _ = viewModel.moveMade(at: Location(column: .B, row: .Three))
        _ = viewModel.moveMade(at: Location(column: .A, row: .Two))
        _ = viewModel.moveMade(at: Location(column: .C, row: .One))
        let moveResult = viewModel.moveMade(at: Location(column: .A, row: .Three))
        guard case let .Win(player) = moveResult else {
            XCTFail("The game should be won by player 1 - A1 - A2 -A3" )
            exit(-1)
        }
        XCTAssert(player == player1)
    }
    
    func testPlayer2WinDiagonally() throws {
        let viewModel = TicTacToeViewModel(player1: player1, player2: player2)
        _ = viewModel.moveMade(at: Location(column: .A, row: .Two))
        _ = viewModel.moveMade(at: Location(column: .A, row: .One))
        _ = viewModel.moveMade(at: Location(column: .A, row: .Three))
        _ = viewModel.moveMade(at: Location(column: .B, row: .Two))
        _ = viewModel.moveMade(at: Location(column: .C, row: .One))
        let moveResult = viewModel.moveMade(at: Location(column: .C, row: .Three))
        guard case let .Win(player) = moveResult else {
            XCTFail("The game should be won by player 2 - A1 - B2 -C3" )
            exit(-1)
        }
        XCTAssert(player == player2)
    }
    
    func testPlayer1WinVertically() throws {
        let viewModel = TicTacToeViewModel(player1: player1, player2: player2)
        _ = viewModel.moveMade(at: Location(column: .A, row: .One))
        _ = viewModel.moveMade(at: Location(column: .B, row: .Two))
        _ = viewModel.moveMade(at: Location(column: .B, row: .One))
        _ = viewModel.moveMade(at: Location(column: .A, row: .Three))
        let moveResult = viewModel.moveMade(at: Location(column: .C, row: .One))
        guard case let .Win(player) = moveResult else {
            XCTFail("The game should be won by player 1 - A1 - B2 -C3" )
            exit(-1)
        }
        XCTAssert(player == player1)
    }
    
}
