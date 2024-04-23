//
//  CountryDetailsPage.swift
//  20. დავალება - Debugging & Instruments
//
//  Created by gvantsa gvagvalia on 4/22/24.
//

import UIKit
import SafariServices

class CountryDetailsPage: UIViewController {
    
    // MARK: - Properties
    let detailedInfo: Country
    
    let detailsScrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isScrollEnabled = true
        view.showsVerticalScrollIndicator = true
        return view
    }()
    
    let detailStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 20
        return view
    }()
    
    let countryNameLabel: LeftAlignedCustomLabel = {
        let label = LeftAlignedCustomLabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    let flagContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.8
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 8
        return view
    }()
    
    let flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let aboutFlagLabel: LeftAlignedCustomLabel = {
        let label = LeftAlignedCustomLabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "About the flag:"
        return label
    }()
    
    let flagInfoText: LeftAlignedCustomLabel = {
        let label = LeftAlignedCustomLabel()
        return label
    }()
    
    let thinLine: CustomThinLine = {
        let line = CustomThinLine()
        return line
    }()
    
    let basicInfoLabel: LeftAlignedCustomLabel = {
        let label = LeftAlignedCustomLabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Basic information:"
        return label
    }()
    
    let independenceHStackView: CustomHStackView = {
        let view = CustomHStackView()
        return view
    }()
    
    let independenceLabel: LeftAlignedCustomLabel = {
        let label = LeftAlignedCustomLabel()
        label.text = "Independent:"
        return label
    }()
    
    let independenceData: RightAlignedCustomLabel = {
        let label = RightAlignedCustomLabel()
        return label
    }()
    
    let spellingHStackView: CustomHStackView = {
        let view = CustomHStackView()
        return view
    }()
    
    let spellingLabel: LeftAlignedCustomLabel = {
        let label = LeftAlignedCustomLabel()
        label.text = "Spelling:"
        return label
    }()
    
    let spellingDataLabel: RightAlignedCustomLabel = {
        let label = RightAlignedCustomLabel()
        return label
    }()
    
    let capitalHStackView: CustomHStackView = {
        let view = CustomHStackView()
        return view
    }()
    
    let capitalLabel: LeftAlignedCustomLabel = {
        let label = LeftAlignedCustomLabel()
        label.text = "Capital:"
        return label
    }()
    
    let capitalDataLabel: RightAlignedCustomLabel = {
        let label = RightAlignedCustomLabel()
        return label
    }()
    
    let populationHStackView: CustomHStackView = {
        let view = CustomHStackView()
        return view
    }()
    
    let populationLabel: LeftAlignedCustomLabel = {
        let label = LeftAlignedCustomLabel()
        label.text = "Population:"
        return label
    }()
    
    let populationDataLabel: RightAlignedCustomLabel = {
        let label = RightAlignedCustomLabel()
        return label
    }()
    
    let regionHStackView: CustomHStackView = {
        let view = CustomHStackView()
        return view
    }()
    
    let regionlabel: LeftAlignedCustomLabel = {
        let label = LeftAlignedCustomLabel()
        label.text = "Region:"
        return label
    }()
    
    let regionDataLabel: RightAlignedCustomLabel = {
        let label = RightAlignedCustomLabel()
        return label
    }()
    
    let neighborsHStackView: CustomHStackView = {
        let view = CustomHStackView()
        return view
    }()
    
    let neighborslabel: LeftAlignedCustomLabel = {
        let label = LeftAlignedCustomLabel()
        label.text = "Neighbors:"
        return label
    }()
    
    let neighborsDataLabel: RightAlignedCustomLabel = {
        let label = RightAlignedCustomLabel()
        return label
    }()
    
    let thinLine2: CustomThinLine = {
        let line = CustomThinLine()
        return line
    }()
    
    let usefulLinksLabel: LeftAlignedCustomLabel = {
        let label = LeftAlignedCustomLabel()
        label.text = "Useful links:"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let mapsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let googleMapsView: UIView = {
        let maps = UIView()
        maps.translatesAutoresizingMaskIntoConstraints = false
        maps.isUserInteractionEnabled = true
        return maps
    }()
    
    let googleMapsImage: CustomImageView = {
        let image = CustomImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "Group 18")
        return image
    }()
    
    let openStreetMapsView: UIView = {
        let maps = UIView()
        maps.translatesAutoresizingMaskIntoConstraints = false
        maps.isUserInteractionEnabled = true
        return maps
    }()
    
    let openStreetMapsImage: CustomImageView = {
        let image = CustomImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "Group 19")
        return image
    }()
    
    // MARK: - LifeCycle
    init(detailedInfo: Country) {
        self.detailedInfo = detailedInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        GetDetailedInfo()
        setupTapGesture()
    }
    
    // MARK: - SetupUI
    func setupUI() {
        view.addSubview(detailsScrollView)
        detailsScrollView.addSubview(detailStackView)
        detailStackView.addArrangedSubview(countryNameLabel)
        detailStackView.addArrangedSubview(flagContainerView)
        flagContainerView.addSubview(flagImageView)
        detailStackView.addArrangedSubview(aboutFlagLabel)
        detailStackView.addArrangedSubview(flagInfoText)
        detailStackView.addArrangedSubview(thinLine)
        detailStackView.addArrangedSubview(basicInfoLabel)
        
        detailStackView.addArrangedSubview(independenceHStackView)
        independenceHStackView.addArrangedSubview(independenceLabel)
        independenceHStackView.addArrangedSubview(independenceData)
        
        detailStackView.addArrangedSubview(spellingHStackView)
        spellingHStackView.addArrangedSubview(spellingLabel)
        spellingHStackView.addArrangedSubview(spellingDataLabel)
        
        detailStackView.addArrangedSubview(capitalHStackView)
        capitalHStackView.addArrangedSubview(capitalLabel)
        capitalHStackView.addArrangedSubview(capitalDataLabel)
        
        detailStackView.addArrangedSubview(populationHStackView)
        populationHStackView.addArrangedSubview(populationLabel)
        populationHStackView.addArrangedSubview(populationDataLabel)
        
        detailStackView.addArrangedSubview(regionHStackView)
        regionHStackView.addArrangedSubview(regionlabel)
        regionHStackView.addArrangedSubview(regionDataLabel)
        
        detailStackView.addArrangedSubview(neighborsHStackView)
        neighborsHStackView.addArrangedSubview(neighborslabel)
        neighborsHStackView.addArrangedSubview(neighborsDataLabel)
        
        detailStackView.addArrangedSubview(thinLine2)
        
        view.addSubview(usefulLinksLabel)
        view.addSubview(mapsView)
        mapsView.addSubview(googleMapsView)
        mapsView.addSubview(openStreetMapsView)
        googleMapsView.addSubview(googleMapsImage)
        openStreetMapsView.addSubview(openStreetMapsImage)
        
        SetupScrollViewConstraints()
        SetupLinksConstraints()
    }
    
    // MARK: - SetupScrollViewConstraints
    func SetupScrollViewConstraints() {
        
        NSLayoutConstraint.activate([
            detailsScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            detailsScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 41),
            detailsScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            detailsScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -133),
            
            detailStackView.leadingAnchor.constraint(equalTo: detailsScrollView.leadingAnchor, constant: 0),
            detailStackView.topAnchor.constraint(equalTo: detailsScrollView.topAnchor, constant: 0),
            detailStackView.trailingAnchor.constraint(equalTo: detailsScrollView.trailingAnchor, constant: 0),
            detailStackView.bottomAnchor.constraint(equalTo: detailsScrollView.bottomAnchor, constant: 0),
            detailStackView.widthAnchor.constraint(equalTo: detailsScrollView.widthAnchor),
            
            flagContainerView.heightAnchor.constraint(equalToConstant: 220),
            
            flagImageView.leadingAnchor.constraint(equalTo: flagContainerView.leadingAnchor),
            flagImageView.trailingAnchor.constraint(equalTo: flagContainerView.trailingAnchor),
            flagImageView.topAnchor.constraint(equalTo: flagContainerView.topAnchor),
            flagImageView.bottomAnchor.constraint(equalTo: flagContainerView.bottomAnchor),
        ])
    }
    // MARK: - SetupLinksConstraints
    func SetupLinksConstraints() {
        NSLayoutConstraint.activate([
            usefulLinksLabel.topAnchor.constraint(equalTo: detailsScrollView.bottomAnchor, constant: 0),
            usefulLinksLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            
            mapsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 94),
            mapsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -94),
            mapsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            mapsView.heightAnchor.constraint(equalToConstant: 50),
            
            googleMapsView.trailingAnchor.constraint(equalTo: mapsView.trailingAnchor),
            googleMapsView.topAnchor.constraint(equalTo: mapsView.topAnchor),
            googleMapsView.bottomAnchor.constraint(equalTo: mapsView.bottomAnchor),
            googleMapsView.widthAnchor.constraint(equalTo: mapsView.widthAnchor, multiplier: 0.33),
            
            googleMapsImage.leadingAnchor.constraint(equalTo: googleMapsView.leadingAnchor),
            googleMapsImage.trailingAnchor.constraint(equalTo: googleMapsView.trailingAnchor),
            googleMapsImage.topAnchor.constraint(equalTo: googleMapsView.topAnchor),
            googleMapsImage.bottomAnchor.constraint(equalTo: googleMapsView.bottomAnchor),
            
            openStreetMapsView.leadingAnchor.constraint(equalTo: mapsView.leadingAnchor),
            openStreetMapsView.topAnchor.constraint(equalTo: mapsView.topAnchor),
            openStreetMapsView.bottomAnchor.constraint(equalTo: mapsView.bottomAnchor),
            openStreetMapsView.widthAnchor.constraint(equalTo: mapsView.widthAnchor, multiplier: 0.33),
            
            openStreetMapsImage.leadingAnchor.constraint(equalTo: openStreetMapsView.leadingAnchor),
            openStreetMapsImage.trailingAnchor.constraint(equalTo: openStreetMapsView.trailingAnchor),
            openStreetMapsImage.topAnchor.constraint(equalTo: openStreetMapsView.topAnchor),
            openStreetMapsImage.bottomAnchor.constraint(equalTo: openStreetMapsView.bottomAnchor),
        ])
    }
    // MARK: - GetDetailedInfo
    func GetDetailedInfo() {
        countryNameLabel.text = detailedInfo.name?.official ?? "country name not available"
        flagInfoText.text = detailedInfo.flags?.alt ?? "flag data not available"
        independenceData.text = detailedInfo.independent?.description ?? "Data not available"
        spellingDataLabel.text = detailedInfo.altSpellings?.last ?? "Spelling data not available"
        capitalDataLabel.text = detailedInfo.capital?.first ?? "Capital data not available"
        populationDataLabel.text = String(detailedInfo.population ?? 0)
        regionDataLabel.text = detailedInfo.region ?? "region data not available"
        neighborsDataLabel.text = detailedInfo.borders?.joined(separator: ", ") ?? "neighbors data not available"
        
        if let imageUrl = URL(string: detailedInfo.flags?.png ?? "") {
            URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        let imageBackground = UIImage(data: data)
                        self.flagImageView.image = imageBackground
                    }
                }
            }.resume()
        }
    }
    // MARK: - SetupTapGesture
    private func setupTapGesture() {
        let googleMapsTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleGoogleMapsTapGesture))
        googleMapsView.addGestureRecognizer(googleMapsTapGesture)
        googleMapsView.isUserInteractionEnabled = true
        
        let openStreetMapsTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleOpenStreetMapsTapGesture))
        openStreetMapsView.addGestureRecognizer(openStreetMapsTapGesture)
        openStreetMapsView.isUserInteractionEnabled = true
    }
    
    @objc private func handleGoogleMapsTapGesture() {
        guard let urlString = detailedInfo.maps?.googleMaps,
              let url = URL(string: urlString) else { return }
        openURLInSafari(url)
    }
    
    @objc private func handleOpenStreetMapsTapGesture() {
        guard let urlString = detailedInfo.maps?.openStreetMaps,
              let url = URL(string: urlString) else { return }
        openURLInSafari(url)
    }
    
    private func openURLInSafari(_ url: URL) {
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
}
