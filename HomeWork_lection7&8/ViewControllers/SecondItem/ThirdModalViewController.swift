//
//  ThirdModalViewController.swift
//  HomeWork_lection7&8
//
//  Created by Евгений Михневич on 19.07.2022.
//

import UIKit

class ThirdModalViewController: UIViewController {

    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var changeCatButton: UIButton!
    @IBOutlet weak var goBackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeCatButton.isHidden = false
        // Do any additional setup after loading the view.
    }

    @IBAction func changeCatButtonDidTap(_ sender: Any) {
        catImageView.image = UIImage(named: "cat4")

        changeCatButton.isHidden = true
        goBackButton.isHidden = false
    }

    @IBAction func goBackButtonDidTap(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
}
