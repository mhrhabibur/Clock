//
//  SearchViewController.swift
//  Clock App
//
//  Created by Habibur Rahman on 10/26/24.
//

import UIKit

class ClockViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
    }
    
    // MARK: - Navigation Bar Setup
    private func setupNavigationBar() {
        navigationItem.title = "Clock"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: #selector(addAlarm)
        )
    }

    @objc func addAlarm() {
        print("Clock Added Successfully")
        self.showToast("Clock Added Successfully")
    }
    
    //MARK: - Table View Setup
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClockCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }

}


