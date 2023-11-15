//
//  infoViewController.swift
//  AlcoholApp
//
//  Created by Кирилл Саталкин on 10.11.2023.
//

import UIKit

enum Alert {
    case success
    case failed
    
    var title: String {
        switch self {
        case .success:
            return "Success"
        case .failed:
            return "Failed"
        }
    }
    
    var message: String {
        switch self {
        case .success:
            return "You can see the results in the Debug area"
        case .failed:
            return "You can see the error in the Debug area"
        }
    }
}
final class infoViewController: UITableViewController {
    
    private var drinks: [Drink] = []
    private var selectedDrink: Drink?
    
    
    private let networkManager = NetworkManager.shared
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 100
        
    }
    
    private func showAlert(withStatus status: Alert) {
        let alert = UIAlertController(title: status.title, message: status.message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        drinks.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let cell = cell as? TableViewCell else { return UITableViewCell() }
        coctails()
        let drink = drinks[indexPath.row]
        cell.configure(with: drink)
        
        cell.layer.borderWidth = 10
        cell.layer.borderColor = UIColor.white.cgColor
        
        return cell
    }
}


extension infoViewController {
    func coctails() {
        networkManager.info(DrinkList.self, from: url) { [unowned self] result in
            switch result {
            case .success(let coctail):
                DispatchQueue.main.async { [self] in
                    drinks = coctail.drinks
                    print(drinks)
                    tableView.reloadData()
                }
            case .failure(_): break
                
            }
        }
    }
}
   
