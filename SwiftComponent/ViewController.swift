//
//  ViewController.swift
//
//  Created by ChrisZhou on 16/1/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var topBtn: UIButton!
    @IBOutlet weak var bottomBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftBtn.iconOnThe(.Left)
        rightBtn.iconOnThe(.Right)
        topBtn.iconOnThe(.Top)
        bottomBtn.iconOnThe(.Bottom)
        
//        leftBtn.iconOnThe(.Left, spacing: 10)
    }


}

