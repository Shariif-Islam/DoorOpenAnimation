//
//  ViewController.swift
//  DoorOpenAnimation
//
//  Created by AdBox on 6/6/17.
//  Copyright © 2017 myth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btn_open: UIButton!
    @IBOutlet weak var rightViewCons: NSLayoutConstraint!
    @IBOutlet weak var leftViewCons: NSLayoutConstraint!
    
    @IBOutlet weak var view_left: UIView!
    @IBOutlet weak var view_right: UIView!
    
    var doorOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func open(_ sender: Any) {
        
        openDoor()
    }
    
    func openDoor() {
    
        self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 1.0, animations: {
            
            self.leftViewCons.constant = self.doorOpen ? -16 : -self.view_left.frame.size.width
             self.rightViewCons.constant = self.doorOpen ? -16 : -self.view_right.frame.size.width
            
            self.view.layoutIfNeeded()
            
        }) { (success) in
            
            if self.doorOpen {
            
                self.doorOpen = false
                self.btn_open.setTitle("open", for: .normal)
            }
            else {
            
                self.doorOpen = true
                self.btn_open.setTitle("close", for: .normal)
            }
            
        }
    }


}

