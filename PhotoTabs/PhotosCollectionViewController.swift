//
//  PhotosCollectionViewController.swift
//  PhotoTabs
//
//  Created by yurik on 6/24/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    let itemsRow: CGFloat = 2 // количество ячеек
    let sectionsInsert = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Второй способ настройки размеров ячейки
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: 10, height: 30)
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        layout.minimumLineSpacing = 1
//        layout.minimumInteritemSpacing = 1

    }

    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 15
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        cell.backgroundColor = .black
       
    
        return cell
    }
}
extension PhotosCollectionViewController : UICollectionViewDelegateFlowLayout {
  
    //метод для настройки ячеек
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //фиксируем количество объектов на ряд
        
        let paddingWidth = sectionsInsert.left * (itemsRow + 1)
        let avalibleWidth = collectionView.frame.width - paddingWidth
        let widthItem = avalibleWidth/itemsRow
        return CGSize(width: widthItem, height: widthItem)
    }

    //отступы ячеек
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionsInsert
    }
    // отступы по ляиниям
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionsInsert.left
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionsInsert.left
    }
}
