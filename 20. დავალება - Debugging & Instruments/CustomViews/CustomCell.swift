//
//  CustomCell.swift
//  20. დავალება - Debugging & Instruments
//
//  Created by gvantsa gvagvalia on 4/21/24.
//

import UIKit

class CustomCell: UITableViewCell {
    
    // MARK: - Properties
    let containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor.white
        containerView.layer.cornerRadius = 25
        containerView.layer.masksToBounds = true
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.borderWidth = 1.0
        return containerView
    }()
    
    let flagImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 3.5
        return view
    }()
    
    let countryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Error"
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .right
        return label
    }()
    
    // MARK: - LifeCycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setupUI
    func setupUI() {
        addSubview(containerView)
        containerView.addSubview(flagImageView)
        containerView.addSubview(countryLabel)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            flagImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            flagImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.4),
            flagImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.09),
            flagImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            countryLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: 5),
            countryLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -34),
            countryLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
        ])
    }
    // MARK: - ConfigureCell
    func configure(with countriesDetails: Country) {
        if let imageUrl = URL(string: countriesDetails.flags?.png ?? "-" ) {
            URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        let imageBackground = UIImage(data: data)
                        self.flagImageView.image = imageBackground
                    }
                }
            }.resume()
        }
        countryLabel.text = countriesDetails.name?.common
    }
}

