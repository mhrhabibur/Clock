//
//  SettingViewController.swift
//  Clock App
//
//  Created by Habibur Rahman on 10/26/24.
//

import UIKit

class TimerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet weak var timerPickView: UIPickerView!
    
    var timerPickerData: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"] {
        didSet {
            timerPickView.reloadAllComponents()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Timer"
        navigationController?.navigationBar.prefersLargeTitles = true
        timerPickView.delegate = self
        timerPickView.dataSource = self
        timerPickView.selectRow(1, inComponent: 1, animated: true)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 24
        } else {
            return 60
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return "\(timerPickerData[row])"
        } else {
            return "\(row)"
        }
        
    }
    
}
