//
//  TableViewCell.swift
//  AlcoholApp
//
//  Created by Кирилл Саталкин on 14.11.2023.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCoctail: UIImageView!
    @IBOutlet weak var idCoctail: UILabel!
    @IBOutlet weak var nameCoctail: UILabel!
    
    private let networkManager = NetworkManager.shared
    
    func configure(with drink: Drink) {
        nameCoctail.text = "Название коктеля: \n \(drink.strDrink)"
        idCoctail.text = "ID коктеля:  \(drink.idDrink)"
        
        if let imageUrl = URL(string: drink.strDrinkThumb) {
            URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                guard let data = data, let image = UIImage(data: data) else { return }
                
                DispatchQueue.main.async {
                    // Установка изображения в ячейку
                    self.imageCoctail.image = image
                }
            }.resume()
        }
    }
}



