//
//  ViewController.swift
//  HWS-Milestone-Day-23
//
//  Created by Ade Dwi Prayitno on 02/12/23.
//

import UIKit

class ViewController: UITableViewController {

    var countries = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Milestone 1"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        countries.append(
            contentsOf: ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        )
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        cell.imageView?.image = UIImage(named: countries[indexPath.row])
        cell.textLabel?.text = countries[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        
        vc.image = countries[indexPath.row]
        vc.title = countries[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

