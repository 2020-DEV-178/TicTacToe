import Foundation
import UIKit


protocol TicTacViewListener {
    func userSelected(column: Column, row: Row) -> MoveResult
}

class TicTacToeView: UIView {
    
    private let imageA1 = UIImageView()
    private let imageA2 = UIImageView()
    private let imageA3 = UIImageView()
    
    private let imageB1 = UIImageView()
    private let imageB2 = UIImageView()
    private let imageB3 = UIImageView()
    
    private let imageC1 = UIImageView()
    private let imageC2 = UIImageView()
    private let imageC3 = UIImageView()
    
    
    
}
