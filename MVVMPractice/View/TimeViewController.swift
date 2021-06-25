//
//  TimeViewController.swift
//  MVVMPractice
//
//  Created by kakao on 2021/06/25.
//

import UIKit

class TimeViewController: UIViewController {
    let viewModel = ViewModel()
    
    @IBOutlet weak var datetimeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.onUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.datetimeLabel.text = self?.viewModel.dateTimeString
            }
        }

        viewModel.reload()
    }
    
    
    @IBAction func onYesterday(_ sender: Any) {
        viewModel.moveDay(day: -1)
    }
    
    @IBAction func onNow(_ sender: Any) {
        datetimeLabel.text = "Loading..."
        viewModel.reload()
    }
    
    @IBAction func onTomorrow(_ sender: Any) {
        viewModel.moveDay(day: 1)
    }
}
