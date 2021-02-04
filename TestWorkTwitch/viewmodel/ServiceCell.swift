//
//  ServiceCell.swift
//  TestWorkTwitch
//
//  Created by Дмитрий Жучков on 28.01.2021.
//
import Foundation
import UIKit
class ServiceCell: UITableViewCell {
    static let reuseId = "ServiceCell"
    var ServiceImage: UIImageView = {
         let image = UIImageView()
          image.translatesAutoresizingMaskIntoConstraints = false
          image.tintColor = .cyan
          return image
      }()
    var nameLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.highlightedTextColor = .white
        infoLabel.textColor = .white
        infoLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        infoLabel.numberOfLines = 5
        return infoLabel
    }()
    var channelsLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.highlightedTextColor = .white
        infoLabel.textColor = .white
        infoLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        infoLabel.numberOfLines = 5
        return infoLabel
    }()
    var viewersLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.highlightedTextColor = .white
        infoLabel.textColor = .white
        infoLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        infoLabel.numberOfLines = 5
        return infoLabel
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(ServiceImage)
        ServiceImage.topAnchor.constraint(equalTo:topAnchor).isActive = true
        ServiceImage.leftAnchor.constraint(equalTo:leftAnchor).isActive = true
        ServiceImage.rightAnchor.constraint(equalTo:rightAnchor).isActive = true
        ServiceImage.bottomAnchor.constraint(equalTo:bottomAnchor).isActive = true
        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo:topAnchor,constant: 250).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -5).isActive = true
        addSubview(channelsLabel)
        channelsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 1).isActive = true
        channelsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        channelsLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -5).isActive = true
        addSubview(viewersLabel)
        viewersLabel.topAnchor.constraint(equalTo: channelsLabel.bottomAnchor,constant: 5).isActive = true
        viewersLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        viewersLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -5).isActive = true
        viewersLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -25).isActive = true
     }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
