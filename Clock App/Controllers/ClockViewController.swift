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
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            let date = Date()
            let formatter = DateFormatter()
            let timeFormatter = DateFormatter()
            formatter.dateStyle = .medium
            timeFormatter.timeStyle = .medium
            self.timeLabel.text = timeFormatter.string(from: date)
            self.dateLabel.text = formatter.string(from: date)
        }
    }
    
    // MARK: - Navigation Bar Setup
    private func setupNavigationBar() {
        navigationItem.title = "Clock"
        navigationController?.navigationBar.prefersLargeTitles = false
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


