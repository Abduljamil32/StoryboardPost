//
//  BaseViewController.swift
//  StoryboardPost
//
//  Created by Avaz Mukhitdinov on 21/07/22.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    
    func appDelegate()-> AppDelegate {
        return UIApplication.shared.delete as! AppDelegate
    }

    func sceneDelegate()-> SceneDelegate {
        return ((UIApplication.shared.connectedScenes.first!.delete as? SceneDelegate)!)
    }
}
