//
//  CollectionViewController.swift
//  AlcoholApp
//
//  Created by Кирилл Саталкин on 10.11.2023.
//

import UIKit

final class MainViewController: UICollectionViewController {
    
    private let networkManager = NetworkManager.shared
    private var drinks: [Drink] = []
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pressedLabel", for: indexPath)
        guard let cell = cell as? LabelViewCell else { return UICollectionViewCell()}
        
        cell.pressLabel.text = "КОКТЕЛИ"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSegue" {
            guard let coctailVC = segue.destination as? infoViewController else { return }
            
            coctailVC.coctails()
            
        }
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 50)
    }
}
