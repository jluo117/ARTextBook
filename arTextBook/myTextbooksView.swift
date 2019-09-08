//
//  myTextbooksView.swift
//  
//
//  Created by Max Gillespie on 9/7/19.
//

import Foundation
import UIKit

class MyTextbooksView: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var textbooks: [String] = ["Comp", "Env"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.dataSource = self
        collectionView?.allowsSelection = true
        collectionView?.register(textbookCell.self, forCellWithReuseIdentifier: "MyCell")
        collectionView?.isScrollEnabled = true
        collectionView?.backgroundColor = .white
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        
//        title.text = textbooks[indexPath]
        
        return cell
    }
}

class textbookCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom text"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    func setupViews() {
        addSubview(self.nameLabel)
        backgroundColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
