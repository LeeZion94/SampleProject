//
//  ViewController.swift
//  SampleProject
//
//  Created by Hyungmin Lee on 2023/03/17.
//

import UIKit
import Then
import SnapKit

//class ViewController: UIViewController {
//
//    var mainNavigationController = UINavigationController().then {
//        $0.view.backgroundColor = .white
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.view.addSubview(mainNavigationController.view)
//        mainNavigationController.view.snp.makeConstraints {
//            $0.leading.trailing.top.bottom.equalToSuperview()
//        }
//
//        var searchController = UISearchController(searchResultsController: nil)
//        searchController.searchBar.placeholder = "키워드를 입력해주세요."
//        searchController.searchBar.backgroundColor = .brown
//
//        mainNavigationController.navigationItem.searchController = searchController
//    }
//}
class ViewController: UIViewController {
    
    var mainNavigationController = UINavigationController(rootViewController: BrowserViewController()).then {
        $0.view.backgroundColor = .black
        $0.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.addSubViews()
        self.loadConstraints()
    }
    
    private
    func loadConstraints() {
        mainNavigationController.view.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    private
    func addSubViews() {
        self.view.addSubview(mainNavigationController.view)
    }
    
}
