//
//  BrowserTableViewCell.swift
//  SampleProject
//
//  Created by Hyungmin Lee on 2023/03/18.
//

import Foundation
import UIKit
import SnapKit
import Then

class BrowserTableViewCell: UITableViewCell {
    let bookImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .red
        $0.image = UIImage(named: "kraken")
    }
    
    let stackView = UIStackView().then {
        $0.distribution = .fillEqually
        $0.axis = .vertical
        $0.spacing = 10
        $0.backgroundColor = .brown
    }
    
    let titleLabel = UILabel().then {
        $0.tintColor = .systemBlue
        $0.text = "TEST"
    }
    
    let descriptionLabel = UILabel().then {
        $0.tintColor = .systemBlue
        $0.text = "TEST"
    }
    
    let priceLabel = UILabel().then {
        $0.text = "TEST"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubviews()
        self.loadConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private
    func loadConstraints() {
        bookImageView.snp.makeConstraints {
            $0.width.height.equalTo(65) // 45 10 10
            $0.top.leading.equalToSuperview().offset(10)
        }
        
        stackView.snp.makeConstraints {
            $0.height.equalTo(65)
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(bookImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        titleLabel.snp.makeConstraints {
            $0.height.equalTo(15)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.height.equalTo(15)
        }
        
        priceLabel.snp.makeConstraints {
            $0.height.equalTo(15)
        }
    }
    
    private
    func addSubviews() {
        [titleLabel, descriptionLabel, priceLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        
        [bookImageView, stackView].forEach {
            self.addSubview($0)
        }
    }
}
