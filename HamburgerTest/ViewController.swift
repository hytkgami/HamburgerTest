//
//  ViewController.swift
//  HamburgerTest
//
//  Created by Hajime Kagami on 2018/06/02.
//  Copyright © 2018年 Hajime Kagami. All rights reserved.
//

import UIKit
import WSCoachMarksView
import Foundation
import QuartzCore

class ViewController: UIViewController {
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var menuButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        let f = self.view.bounds
        let arrCoach = [
            [
                "rect" : CGRect(x: 4.0, y: 22.0, width: 45, height: 45),
                "caption" : "ここをタップすると\nメニューが開きます",
                "shape" : "circle"
            ],
        ]
        guard let coach = WSCoachMarksView(frame: f, coachMarks: arrCoach) else {
            return
        }
        coach.maskColor = UIColor(white: 0.0, alpha: 0.65)
        self.view.addSubview(coach)
        self.view.bringSubview(toFront: coach)
        coach.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapMenu(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "showMenu", sender: nil)
    }
}

