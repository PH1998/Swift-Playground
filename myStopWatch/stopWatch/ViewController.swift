//
//  ViewController.swift
//  stopWatch
//
//  Created by Sebastian Hette on 14.09.2016.
//  Copyright © 2016 Sebastian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbl: UILabel!
    
    var time = 0
    
    //timer
    var timer = Timer()
    
    @IBAction func start(_ sender: UIButton)
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
    }
    @IBAction func pause(_ sender: AnyObject)
    {
        timer.invalidate()
    }
    @IBAction func reset(_ sender: AnyObject)
    {
        //timer.invalidate()
        time = 0
        lbl.text = ("0")
    }
    
    func action()
    {
        time += 1
        lbl.text = String(time)
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

