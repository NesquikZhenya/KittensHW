//
//  ShowTableViewController.swift
//  HomeWork_lection7&8
//
//  Created by Евгений Михневич on 24.07.2022.
//

import UIKit

class ShowTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func showTableButtonDidTap(_ sender: Any) {
        let controller = CustomTableViewController()
        present(controller, animated: true)
    }
    
}
