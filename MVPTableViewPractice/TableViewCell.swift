//
//  TableViewCell.swift
//  MVPTableViewPractice
//
//  Created by 坂本龍哉 on 2021/04/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var Label: UILabel!
    
    static let reuseIdentifier = "Cell1"
    
}
