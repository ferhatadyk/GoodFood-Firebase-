//
//  SearchViewController.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 27.10.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    
    // MARK: -outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: -variables
    var data = ["Tonno Pizza", "Islak Hamburger", "Sushi", "Fındık Lahmacun","Karışık Pizza","Chessburger","Midye","Tavuklu Cheddarlı Salata","Filtre Kahve","Soda"]
    var filteredData: [String]!

    // MARK: -lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredData = data
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
}
// MARK: -extension
extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    
    // MARK: -tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
}
// MARK: -extensions
extension SearchViewController: UISearchBarDelegate {
    
    // MARK: -functions
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if searchText == "" {
            filteredData = data
        }
        for word  in data  {
            if word.uppercased().contains(searchText.uppercased()) {
                filteredData.append(word)
            }
        }
        tableView.reloadData()
    }
    
}
