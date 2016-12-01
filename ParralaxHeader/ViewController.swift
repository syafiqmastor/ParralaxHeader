//
//  ViewController.swift
//  ParralaxHeader
//
//  Created by Syafiq on 11/4/16.
//  Copyright © 2016 Syafiq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    weak var imageCenterYConstraint : NSLayoutConstraint?
    
    let imageCellIdentifier = "ImageCell"
    let textCellIdentifier = "TextCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier = ""
        
        switch indexPath.section {
        case 0:
            cellIdentifier = imageCellIdentifier
        case 1:
            cellIdentifier = textCellIdentifier
        default:
            ()
        }
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
//        if let imageCell = cell as? ImageCell {
//            imageCenterYConstraint = imageCell.imageCenterYConstraint
//        }
        
        return cell
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return UITableViewAutomaticDimension
        default: ()
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 200
        default:
            return 50
        }
    }
}

extension ViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let imageCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? ImageCell {
            imageCell.scrollViewDidScroll(scrollView)
        }
    }
}
