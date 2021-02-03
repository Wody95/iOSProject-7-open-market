//
//  ProductListTableViewCell.swift
//  OpenMarket
//
//  Created by 김태형 on 2021/01/28.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {
    static let identifier: String = "ProductListTableViewCell"
    let productNameLabel: UILabel = UILabel()
    let productPriceLabel: UILabel = UILabel()
    let productStockLabel: UILabel = UILabel()
    let productThumbnailImageView: UIImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpImageView()
        setUpLabel()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpImageView() {
        productThumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        productThumbnailImageView.contentMode = .scaleAspectFit
    }
    
    private func setUpLabel() {
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        productNameLabel.font = .preferredFont(forTextStyle: .headline)
        productNameLabel.adjustsFontForContentSizeCategory = true
        productNameLabel.textColor = .black
        productNameLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        productNameLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        productStockLabel.translatesAutoresizingMaskIntoConstraints = false
        productStockLabel.font = .preferredFont(forTextStyle: .body)
        productStockLabel.adjustsFontSizeToFitWidth = true
        productStockLabel.adjustsFontForContentSizeCategory = true
        productStockLabel.textColor = .gray
        productStockLabel.textAlignment = .right
        productStockLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        productStockLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        productPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        productPriceLabel.font = .preferredFont(forTextStyle: .body)
        productPriceLabel.adjustsFontForContentSizeCategory = true
        productPriceLabel.textColor = .gray
        productPriceLabel.minimumScaleFactor = .leastNormalMagnitude
    }
    
    private func setUpConstraints() {
        self.contentView.addSubview(productNameLabel)
        self.contentView.addSubview(productPriceLabel)
        self.contentView.addSubview(productThumbnailImageView)
        self.contentView.addSubview(productStockLabel)
        
        NSLayoutConstraint.activate([
            productThumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            productThumbnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            productThumbnailImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            productThumbnailImageView.heightAnchor.constraint(equalTo: productThumbnailImageView.widthAnchor, multiplier: 1),
            productThumbnailImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            productNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            productNameLabel.leadingAnchor.constraint(equalTo: productThumbnailImageView.trailingAnchor, constant: 10),
            
            productPriceLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 5),
            productPriceLabel.leadingAnchor.constraint(equalTo: productNameLabel.leadingAnchor),
            productPriceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            productStockLabel.topAnchor.constraint(equalTo: productNameLabel.topAnchor),
            productStockLabel.leadingAnchor.constraint(equalTo: productNameLabel.trailingAnchor, constant: 5),
            productStockLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
        ])
    }
    override func prepareForReuse() {
        productStockLabel.textColor = .gray
    }
}

extension Int {
    func addComma() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let changedUnit = numberFormatter.string(from: NSNumber(value: self)) else {
            return ""
        }
        return changedUnit
    }
}
