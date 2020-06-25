//
//  PhotoDetailViewController.swift
//  PhotoTabs
//
//  Created by yurik on 6/25/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
   //свойство для получения изображения с другого контроллера
    var image:  UIImage?
    @IBOutlet weak var imageDetail: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageDetail.image = image
       
    }
    
    @IBAction func shareAction(_ sender: UIButton) {
        
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        
        
        present(shareController, animated: true, completion: nil)
        
    }
    

}
