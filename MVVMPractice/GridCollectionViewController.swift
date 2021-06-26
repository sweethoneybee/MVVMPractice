//
//  ViewController.swift
//  MVVMPractice
//
//  Created by kakao on 2021/06/25.
//

import UIKit

class GridCollectionViewController: UIViewController {

    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHirearchy()
    }
}

extension GridCollectionViewController {
    func configureHirearchy() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 32, weight: .heavy)
            label.textAlignment = .left
            label.text = "Order"
            
            return label
        }()
        
        let resetButton: UIButton = {
            let btn = UIButton(type: .system)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.setTitle("reset", for: .normal)
            btn.tintColor = .black
            btn.addTarget(self, action: #selector(onResetButton), for: .touchUpInside)
            
            return btn
        }()
        
        let stackView: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [titleLabel, tableView, resetButton])
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.axis = .vertical
            stack.distribution = .fill
            stack.alignment = .fill
            return stack
        }()
        view.addSubview(stackView)
        
        let constraints = [
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension GridCollectionViewController {
    @objc func onResetButton() {
        print("버튼눌림")
    }
}
