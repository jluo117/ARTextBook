//
//  myTextbooksView.swift
//  
//
//  Created by Max Gillespie on 9/7/19.
//

import Foundation
import UIKit

class MyTextbooksView: UIViewController, UICollectionViewDataSource {
    var textbooks: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textbooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cvCell", for: indexPath)
        
        cell.backgroundColor = .white
        
        return cell
    }
}
