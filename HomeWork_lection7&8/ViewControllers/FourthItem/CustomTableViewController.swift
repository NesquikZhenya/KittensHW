//
//  CustomTableViewController.swift
//  HomeWork_lection7&8
//
//  Created by Евгений Михневич on 24.07.2022.
//

import UIKit

class CustomTableViewController: UITableViewController {
    
    var cats = [
        MemeInfo(name: "Meow2", image: "cat2", download: false),
        MemeInfo(name: "Meow3", image: "cat3", download: false),
        MemeInfo(name: "Meow4", image: "cat4", download: false),
        MemeInfo(name: "Meow5", image: "cat5", download: false)
    ]
    
    var rareCats = [
        MemeInfo(name: "rareMeow1", image: "rareCat1", download: false),
        MemeInfo(name: "rareMeow2", image: "rareCat2", download: false),
        MemeInfo(name: "rareMeow3", image: "rareCat3", download: false),
        MemeInfo(name: "rareMeow4", image: "rareCat4", download: false),
        MemeInfo(name: "rareMeow5", image: "rareCat5", download: false)
    ]
    
    var doggos = [
        MemeInfo(name: "Woph1", image: "Doggo1", download: false),
        MemeInfo(name: "Woph2", image: "Doggo2", download: false),
        MemeInfo(name: "Woph3", image: "Doggo3", download: false),
        MemeInfo(name: "Woph4", image: "Doggo4", download: false),
        MemeInfo(name: "Woph5", image: "Doggo5", download: false),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0: return cats.count
            case 1: return rareCats.count
            case 2: return doggos.count
            default: return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = MemesHeaderView()
        switch section {
            case 0: view.headerLabel.text = "CATS"
            case 1: view.headerLabel.text = "RARE CATS"
            case 2: view.headerLabel.text = "DOGGOS"
            default: view.headerLabel.text = "DOWNLOAD MEMES"
                        view.headerLabel.textColor = .white
                        view.backgroundColor = .darkGray
        }
        return view
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell {
            switch indexPath.section{
                case 0: cell.updateMemeInfo(meme: cats[indexPath.row])
                case 1: cell.updateMemeInfo(meme: rareCats[indexPath.row])
                default: cell.updateMemeInfo(meme: doggos[indexPath.row])
            }
            cell.delegate = self
            cell.cellSectionIndex = indexPath.section
            cell.cellIndex = indexPath.row
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}

extension CustomTableViewController: CheckUpdatable {
    func updateCheck(cellSectionIndex: Int, cellIndex:Int) {
        switch cellSectionIndex {
            case 0: cats[cellIndex].download.toggle()
            case 1: rareCats[cellIndex].download.toggle()
            default: doggos[cellIndex].download.toggle()
        }
        tableView.reloadData()
    }
}
