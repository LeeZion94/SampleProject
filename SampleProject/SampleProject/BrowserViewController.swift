//
//  BrowserViewController.swift
//  SampleProject
//
//  Created by Hyungmin Lee on 2023/03/18.
//

import Foundation
import UIKit

import SnapKit
import Then

class BrowserViewController: UIViewController {
    let textField = UITextField().then {
        $0.clearButtonMode = .always
        $0.backgroundColor = .blue
        $0.placeholder = "키워드를 입력해주세요"
        $0.layer.cornerRadius = 10.0
    }
    
    lazy var tableView = UITableView().then {
        $0.backgroundColor = .brown
        $0.dataSource = self
        $0.delegate = self
        $0.register(BrowserTableViewCell.self, forCellReuseIdentifier: "BrowserTableViewCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        self.addSubViews()
        self.loadConstraints()
    }
    
    private
    func loadConstraints() {
        textField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(30)
            $0.height.equalTo(35)
        }
        
        tableView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(textField.snp.bottom).offset(20)
        }
    }
    
    private
    func addSubViews() {
        [textField, tableView].forEach {
            self.view.addSubview($0)
        }
    }
}

extension BrowserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        85
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BrowserTableViewCell", for: indexPath) as? BrowserTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    
}
