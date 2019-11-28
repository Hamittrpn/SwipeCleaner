//
//  CardVC.swift
//  SwipeCleaner
//
//  Created by Hamit  Tırpan on 26.11.2019.
//  Copyright © 2019 Hamit  Tırpan. All rights reserved.
//

import UIKit

class CardVC: UIViewController {
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var darkFillView: UIView!
    @IBOutlet weak var toggleMenuButton: UIButton!
    @IBOutlet weak var instagramButton: UIButtonX!
    @IBOutlet weak var facebookButton: UIButtonX!
    @IBOutlet weak var whatsappButton: UIButtonX!
    @IBOutlet weak var card: UIViewX!
    @IBOutlet weak var thumbImageView: UIImageView!
    
    var divisor : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        divisor = (view.frame.width / 2) / 0.61
        hideButtons()
    }
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        let scale = min(100/abs(xFromCenter), 1)
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        card.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor).scaledBy(x: scale, y: scale)
        
        if xFromCenter > 0 {
            thumbImageView.image = .init(imageLiteralResourceName: "trash")
            thumbImageView.tintColor = UIColor.red
        } else {
            thumbImageView.image = .init(imageLiteralResourceName: "fav")
            thumbImageView.tintColor = UIColor.green
        }
        
        thumbImageView.alpha = abs(xFromCenter) / view.center.x
        
        if sender.state == UIGestureRecognizer.State.ended {
            
            if card.center.x < 75 {
                // Move of to the left side
                UIView.animate(withDuration: 0.3) {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0
                }
                return
            } else if card.center.x > (view.frame.width - 75) {
                // Move of the right side
                UIView.animate(withDuration: 0.3) {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0
                }
                return
            }
            undoCard()
        }
    }
    
    @IBAction func undoClicked(_ sender: UIButton) {
        undoCard()
    }
    
    @IBAction func toggleMenuClicked(_ sender: Any) {
        toggleMenu()
    }
    
    func undoCard(){
        UIView.animate(withDuration: 0.2) {
            self.card.center = self.view.center
            self.thumbImageView.alpha = 0
            self.card.alpha = 1
            self.card.transform = .identity
        }
    }
}
