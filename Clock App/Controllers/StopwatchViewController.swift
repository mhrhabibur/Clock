//
//  ProfileViewController.swift
//  Clock App
//
//  Created by Habibur Rahman on 10/26/24.
//

import UIKit

class StopwatchViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var timer: Timer = Timer()
    var count: Int = 0
    var isRunning: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Stopwatch"
        navigationController?.navigationBar.prefersLargeTitles = true
        startStopButton.setTitleColor(.blue, for: .normal)
        resetButton.isEnabled = false
    }
    
    @IBAction func startStopButtonTapped(_ sender: Any) {
        if isRunning {
            isRunning = false
            timer.invalidate()
            startStopButton.setTitle("Start", for: .normal)
            startStopButton.setTitleColor(.link, for: .normal)
        } else {
            isRunning = true
            startStopButton.setTitle("Pause", for: .normal)
            startStopButton.setTitleColor(.red, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            resetButton.isEnabled = true
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Reset", message: "Are you sure you want to reset the timer?", preferredStyle: .alert)
        let resetAction = UIAlertAction(title: "Reset", style: .destructive) { _ in
            self.resetTimer()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(resetAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func resetTimer() {
        timer.invalidate()
        let time = secondsToHoursMinutesSeconds(0)
        let timeString = makesTimeString(time)
        timerLabel.text = timeString
        count = 0
        isRunning = false
        resetButton.isEnabled = false
        startStopButton.setTitle("Start", for: .normal)
        startStopButton.setTitleColor(.link, for: .normal)
    }
    
    @objc func updateTimer() {
        count += 1
        let time = secondsToHoursMinutesSeconds(count)
        let timeString = makesTimeString(time)
        timerLabel.text = timeString
    }

    func secondsToHoursMinutesSeconds(_ seconds: Int) -> (hours: Int, minutes: Int, seconds: Int) {
        return (seconds / 3600, (seconds % 3600) / 60, seconds % 60)
    }
    
    func makesTimeString(_ time: (hours: Int, minutes: Int, seconds: Int)) -> String {
        return String(format: "%02d:%02d:%02d", time.hours, time.minutes, time.seconds)
    }
}
