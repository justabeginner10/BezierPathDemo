//
//  ViewController.swift
//  BezierPathDemo
//
//  Created by Aditya on 07/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create an instance of PortraitOutlineView
        let outlineView = PortraitOutlineView(frame: self.view.bounds)
        
        // Add it to the view controller's view
        view.addSubview(outlineView)
    }
    
    
}

