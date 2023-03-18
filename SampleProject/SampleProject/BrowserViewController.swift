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
    
    let tableView = UITableView().then {
        $0.backgroundColor = .blue
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

