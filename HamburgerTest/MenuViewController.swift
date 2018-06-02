//
//  MenuViewController.swift
//  HamburgerTest
//
//  Created by Hajime Kagami on 2018/06/02.
//  Copyright © 2018年 Hajime Kagami. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet var wrapView: UIView!
    @IBOutlet var menuView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let menuPosition = self.menuView.layer.position

        self.menuView.layer.position.x = -self.menuView.frame.width

        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseOut, animations: {
                        self.menuView.layer.position.x = menuPosition.x
        }, completion: {
            bool in
        })
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch in touches {
            if touch.view == self.wrapView {
                closeMenu()
            }
        }
    }

    @IBAction func rightSwipe(_ sender: UISwipeGestureRecognizer) {
        closeMenu()
    }

    private func closeMenu() {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: {
                        self.menuView.layer.position.x = -self.menuView.frame.width
        }, completion: { bool in
            self.dismiss(animated: true, completion: nil)
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
