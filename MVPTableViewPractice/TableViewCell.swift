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
    
    func configure(changeString: String) {
        Label.text = changeString
        let num = String(arc4random_uniform(5) + 1)
        myImageView.image = UIImage(named: num)
    }
    
}
