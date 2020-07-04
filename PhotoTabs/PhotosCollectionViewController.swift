//
//  PhotosCollectionViewController.swift
//  PhotoTabs
//
//  Created by yurik on 6/24/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    let itemsRow: CGFloat = 1 // количество ячеек
    let sectionsInsert = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    let photos = ["dog1", "dog2", "dog3", "dog4", "dog5", "dog6", "dog7", "dog8", "dog9", "dog10", "dog11", "dog12", "dog13", "dog14", "dog15" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Второй способ настройки размеров ячейки
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: 10, height: 30)
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        layout.minimumLineSpacing = 1
//        layout.minimumInteritemSpacing = 1

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailPhotoSegue" {
            //добираемся до того контроллера на который переходим
            let photoDetailVC = segue.destination as! PhotoDetailViewController
            // добираемся до ячейки контроллера с которой передаем изображение
            let cell = sender as! PhotoCell
            //передаем фотку с ячейки на второй экран деталей (PhotoDetailViewController)
            photoDetailVC.image = cell.dogImageView.image
        }
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        
        //добираемся до объектов массива и до фоток в папке assets
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        
        cell.dogImageView.image = image
       // cell.backgroundColor = .black
       
    
        return cell
    }
}
extension PhotosCollectionViewController : UICollectionViewDelegateFlowLayout {
  
    
   // let itemsRow: CGFloat = 1 // количество ячеек
   // let sectionsInsert = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
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
/*
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
 */
