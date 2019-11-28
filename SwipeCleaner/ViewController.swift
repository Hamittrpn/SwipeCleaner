//
//  ViewController.swift
//  SwipeCleaner
//
//  Created by Hamit  Tırpan on 26.11.2019.
//  Copyright © 2019 Hamit  Tırpan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.alpha = 0
        titleLabel.alpha = 0
        goButton.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.8, animations: {
            self.imageView.alpha = 1
        }) { (true) in
            UIView.animate(withDuration:  1, animations: {
                self.titleLabel.alpha = 1
            }, completion: { (true) in
                UIView.animate(withDuration: 1.5, animations: {
                    self.goButton.alpha = 1
                }, completion: nil)
            })
        }
    }
    
    @IBAction func goButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "toCard", sender: nil)
    }
}

