//
//  SecondModalViewController.swift
//  HomeWork_lection7&8
//
//  Created by Евгений Михневич on 19.07.2022.
//

import UIKit

class SecondModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func thirdModalButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "ThirdModalViewController")
        self.present(controller, animated: true)
    }
    
   

}
