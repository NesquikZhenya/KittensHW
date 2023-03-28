//
//  DataReceivingViewController.swift
//  HomeWork_lection7&8
//
//  Created by Евгений Михневич on 23.07.2022.
//

import UIKit

class DataReceivingViewController: UIViewController, HeightReceiving {
    
    func updateHeight(height: String, unit: String) {
        heightAmountLabel.text = height
        heightUnitLabel.text = unit
        insertHeightButton.isHidden = true
        heightAmountLabel.isHidden = false
        heightUnitLabel.isHidden = false
        nextScreenButton.isHidden = false
    }
    
    var name: String = "Unknown"

    @IBOutlet weak var insertHeightButton: UIButton!
    @IBOutlet weak var heightAmountLabel: UILabel!
    @IBOutlet weak var heightUnitLabel: UILabel!
    @IBOutlet weak var nextScreenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapRecogniser = UITapGestureRecognizer()
        tapRecogniser.addTarget(self, action: #selector(DataReceivingViewController.didTapView))
        self.view.addGestureRecognizer(tapRecogniser)
    }

    @objc func didTapView() {
        self.view.endEditing(true)
    }

    @IBAction func nameTextFieldEditingDidEnd(_ sender: UITextField) {
        self.name = sender.text ?? "Unknown"
    }
    
    @IBAction func insertHeightButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        if let controller = storyboard.instantiateViewController(withIdentifier: "DataPassingViewController") as? DataPassingViewController {
            controller.name = self.name
            controller.delegate = self
            present(controller, animated: true)
        }
    }
    
    @IBAction func nameTextFieldDoneButtonDidTap(_ sender: UITextField) {
        sender.endEditing(true)
    }
    
    @IBAction func nextScreenButtonDidTap(_ sender: Any) {
        let controller = HandmadeViewController()
        navigationController?.pushViewController(controller, animated: true)
        controller.name = self.name
    }
    
}
    

