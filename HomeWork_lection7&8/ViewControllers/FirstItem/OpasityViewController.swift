//
//  OpasityViewController.swift
//  HomeWork_lection7&8
//
//  Created by Евгений Михневич on 19.07.2022.
//

import UIKit

class OpasityViewController: UIViewController {

    @IBOutlet weak var rectangleView: UIView!
    @IBOutlet weak var opasitySlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "First Item Third Screen"
    }
    
    @IBAction func opasitySliderDidChange(_ sender: Any) {
        rectangleView.layer.opacity = opasitySlider.value
    }
    
}
