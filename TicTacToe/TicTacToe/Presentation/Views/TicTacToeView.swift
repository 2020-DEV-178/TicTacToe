import Foundation
import UIKit


class TicTacToeView: UIView {
        
    weak private var listener: TicTacToeViewListener?
    
    private func onItemClicked(column: Column, row: Row, on imageView: UIImageView) {
        guard let result = listener?.userSelected(column: column, row: row) else { return }
        switch result {
        case .Authorized(let player): imageView.image = player.image
        case .Draw, .Win: isUserInteractionEnabled = false
        case .Forbiden: break
        }
    }
    
    @IBOutlet public var imageA1: UIImageView! {
        didSet {
            imageA1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onImageViewClicked(gesture:))))
        }
    }
    @IBOutlet private var imageA2: UIImageView!{
        didSet {
            imageA2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onImageViewClicked(gesture:))))
        }
    }
    @IBOutlet private var imageA3: UIImageView!{
        didSet {
            imageA3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onImageViewClicked(gesture:))))
        }
    }
    
    @IBOutlet private var imageB1: UIImageView!{
        didSet {
            imageB1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onImageViewClicked(gesture:))))
        }
    }
    @IBOutlet private var imageB2: UIImageView!{
        didSet {
            imageB2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onImageViewClicked(gesture:))))
        }
    }
    @IBOutlet private var imageB3: UIImageView!{
        didSet {
            imageB3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onImageViewClicked(gesture:))))
        }
    }
    
    @IBOutlet private var imageC1: UIImageView!{
        didSet {
            imageC1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onImageViewClicked(gesture:))))
        }
    }
    @IBOutlet private var imageC2: UIImageView!{
        didSet {
            imageC2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onImageViewClicked(gesture:))))
        }
    }
    @IBOutlet private var imageC3: UIImageView!{
        didSet {
            imageC3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onImageViewClicked(gesture:))))
        }
    }
    
    @objc func onImageViewClicked(gesture: UITapGestureRecognizer) {
        guard let imageView =  gesture.view as? UIImageView else { return }
        var column: Column?
        var row: Row?
        switch imageView.tag {
        case 1: do {
            column = .A
            row = .One
        }
        case 2: do {
            column = .B
            row = .One
        }
        case 3: do {
            column = .C
            row = .One
        }
        case 4: do {
            column = .A
            row = .Two
        }
        case 5: do {
            column = .B
            row = .Two
        }
        case 6: do {
            column = .C
            row = .Two
        }
        case 7: do {
            column = .A
            row = .Three
        }
        case 8: do {
            column = .B
            row = .Three
        }
        case 9: do {
            column = .C
            row = .Three
        }
        default: break
        }
        
        if let column = column, let row = row {
            onItemClicked(column: column, row: row, on: imageView)
        }
    }
    
    
}
