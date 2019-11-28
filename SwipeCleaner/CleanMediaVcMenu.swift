//
//  CleanMediaVcMenu.swift
//  SwipeCleaner
//
//  Created by Hamit  Tırpan on 27.11.2019.
//  Copyright © 2019 Hamit  Tırpan. All rights reserved.
//

import UIKit

extension CardVC{
    
    func hideButtons(){        
        instagramButton.alpha = 0
        facebookButton.alpha = 0
        whatsappButton.alpha = 0
    }
    
    func toggleMenu(){
        if darkFillView.transform == CGAffineTransform.identity{
            UIView.animate(withDuration: 1, animations: {
                self.darkFillView.transform = CGAffineTransform(scaleX: 11, y: 11)
                self.menuView.transform = CGAffineTransform(translationX:  0, y: -104)
                self.toggleMenuButton.transform = CGAffineTransform(rotationAngle: self.radians(degrees: 180))
            }) { (true) in
                UIView.animate(withDuration: 0.5, animations: {
                    self.toggleSharedButtons()
                })
            }
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.darkFillView.transform = .identity
                self.menuView.transform = .identity
                self.toggleMenuButton.transform = .identity
                self.toggleSharedButtons()
            })
        }
    }
    
    func toggleSharedButtons(){
        let alpha = CGFloat(self.facebookButton.alpha == 0 ? 1 : 0)
        self.facebookButton.alpha = alpha
        self.instagramButton.alpha = alpha
        self.whatsappButton.alpha = alpha
        
    }
    
    // RotationAngle'da 180 derece istenilen davranışı göstermediği için bu metodu oluşturdum
    func radians( degrees : Double) -> CGFloat{
        return CGFloat(degrees * .pi / degrees)
    }
}
