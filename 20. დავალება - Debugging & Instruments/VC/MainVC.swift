//
//  MainVC.swift
//  20. დავალება - Debugging & Instruments
//
//  Created by gvantsa gvagvalia on 4/21/24.
//

import UIKit

class MainVC: UIViewController {
    
    // MARK: - Properties
    var countriesModel: [Country] = []
    
    let countriesTableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(CustomCell.self, forCellReuseIdentifier: "countriesCell")
        view.separatorStyle = .none
        return view
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        countriesTableView.dataSource = self
        countriesTableView.delegate = self
        setupUI()
        fetchCountryData()
    }
    
    
    // MARK: - SetupUI
    func setupUI() {
        view.addSubview(countriesTableView)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Countries"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        NSLayoutConstraint.activate([
            countriesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21),
            countriesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            countriesTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -27),
            countriesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
    
    // MARK: - FetchData
    func fetchCountryData() {
        let urlString = "https://restcountries.com/v3.1/all"
        guard let urlObject = URL(string: urlString) else {
            print("no url")
            return
        }
        
        URLSession.shared.dataTask(with: urlObject) { data, response, error in
            
            if error != nil {
                print("errorrrr")
                return
            }
            
            guard let data = data else {
                print("no data")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([Country].self, from: data)
                self.countriesModel = decodedData
                
                DispatchQueue.main.async {
                    self.countriesTableView.reloadData()
                    print(self.countriesModel.first?.name?.common ?? "nooo namee")
                    print(self.countriesModel.first?.flag ?? "noo flaggg")
                }
                
            } catch {
                print("error decoding json \(error.localizedDescription)")
            }
            
        }.resume()
    }
}

// MARK: - Extensions
extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countriesModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  countriesTableView.dequeueReusableCell(withIdentifier: "countriesCell", for: indexPath) as! CustomCell
        let countriesDetails = countriesModel[indexPath.row]
        cell.configure(with: countriesDetails)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}

extension MainVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedRow = countriesModel[indexPath.row]
        let detailsVC = CountryDetailsPage(detailedInfo: selectedRow)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

//#Preview {
//    MainVC()
//}
