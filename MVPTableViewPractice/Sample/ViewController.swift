//
//  ViewController.swift
//  MVPTableViewPractice
//
//  Created by 坂本龍哉 on 2021/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private var presenter: SamplePresenterInput!
    func inject(presenter: SamplePresenterInput) {
        self.presenter = presenter
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate  = self
        
    }
    
    private func setup() {  // tableViewの設定
        tableView.estimatedRowHeight = 64
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil),
                           forCellReuseIdentifier: TableViewCell.reuseIdentifier)
    }
    
    
}

extension ViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.didTapSearchButton(text: searchBar.text)
        self.searchBar.resignFirstResponder()
    }
}

extension ViewController : UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfString
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as! TableViewCell
        
        let change = presenter.string()
        cell.configure(changeString: change[indexPath.row])
        
        return cell
    }
    
    
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}

extension ViewController : SamplePresenterOutput {
    func update() {
        tableView.reloadData()
    }
    
    
}



