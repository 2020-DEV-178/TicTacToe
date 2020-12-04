import Foundation
import UIKit

struct Player: Equatable {

    let name: String
    let image: UIImage
    
    static func ==(lhs: Player, rhs: Player) -> Bool {
        return lhs.name == rhs.name
    }
}
