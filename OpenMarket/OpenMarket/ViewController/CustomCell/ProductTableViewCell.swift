//
//  ProductTableViewCell.swift
//  OpenMarket
//
//  Created by Jinho Choi on 2021/01/29.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    static let identifier = "ProductTableViewCell"
    let thumbnailImageView = UIImageView()
    let titleLabel = UILabel()
    let priceBeforeSaleLabel = UILabel()
    let priceLabel = UILabel()
    let stockLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
        
        self.contentView.addSubview(thumbnailImageView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(priceBeforeSaleLabel)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(stockLabel)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceBeforeSaleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        stockLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.adjustsFontSizeToFitWidth = true
        priceBeforeSaleLabel.adjustsFontSizeToFitWidth = true
        priceLabel.adjustsFontSizeToFitWidth = true
        stockLabel.adjustsFontSizeToFitWidth = true
        
        titleLabel.font = .preferredFont(forTextStyle: .headline)
        priceBeforeSaleLabel.font = .preferredFont(forTextStyle: .body)
        priceLabel.font = .preferredFont(forTextStyle: .body)
        stockLabel.font = .preferredFont(forTextStyle: .body)
        
        stockLabel.textAlignment = .right
        
        priceBeforeSaleLabel.textColor = .red
        priceLabel.textColor = .gray
        stockLabel.textColor = .gray
        
        NSLayoutConstraint.activate([
            thumbnailImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.17),
            thumbnailImageView.heightAnchor.constraint(equalTo: thumbnailImageView.widthAnchor, multiplier: 1),
            thumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            thumbnailImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 10)
        ])
        NSLayoutConstraint.activate([
            stockLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            stockLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            stockLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            priceBeforeSaleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            priceBeforeSaleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 10),
            priceBeforeSaleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: priceBeforeSaleLabel.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: priceBeforeSaleLabel.trailingAnchor, constant: 10),
            priceLabel.bottomAnchor.constraint(equalTo: priceBeforeSaleLabel.bottomAnchor)
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
