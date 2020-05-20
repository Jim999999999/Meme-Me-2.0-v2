//
//  CollectionViewController.swift
//  MemeMe 2.0 v2
//
//  Created by James Miller on 5/7/20.
//  Copyright © 2020 James Miller. All rights reserved.
//

import UIKit
import Foundation

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var allMemes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView!.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space: CGFloat = 3.0
        let widthDimention = (view.frame.size.width - (2 * space)) / 3.0
        let heightDimention = (view.frame.size.height - (3 * space)) / 5.0

        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: widthDimention, height:heightDimention)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return self.allMemes.count
      }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let meme = self.allMemes[(indexPath as NSIndexPath).row]
        
        cell.collectionImageView.image = meme.memedImage
        
        
        return cell
    
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "SentViewDetailController") as! SentViewDetailController
            
        detailController.memes = self.allMemes[(indexPath as NSIndexPath).row]
        
        navigationController!.pushViewController(detailController, animated: true)
        
    }


}
