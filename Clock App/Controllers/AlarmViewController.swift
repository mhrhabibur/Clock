//
//  ViewController.swift
//  Clock App
//
//  Created by Habibur Rahman on 10/26/24.
//

import UIKit

class AlarmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    
    /// This is really cool things in xCode
    ///
    // MARK: - Navigation Bar
    private func setupNavigationItem() {
        navigationItem.title = "Alarm"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: #selector(addAlarm)
        )
    }

    @objc private func addAlarm() {
        self.showToast("Alarm adde successfully")
    }

    // MARK: - TableView
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "AlarmCell", for: indexPath)
        cell.textLabel?.text = "Alarm \(indexPath.row)"
        return cell
    }

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        print("ok")
    }

}

