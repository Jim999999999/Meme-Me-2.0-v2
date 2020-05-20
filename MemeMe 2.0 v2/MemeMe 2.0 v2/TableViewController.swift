//
//  TableViewController.swift
//  MemeMe 2.0 v2
//
//  Created by James Miller on 5/6/20.
//  Copyright © 2020 James Miller. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    
    var allMemes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }


    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         tableView!.reloadData()
     }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allMemes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")!
        let meme = self.allMemes[(indexPath as NSIndexPath).row]
        
        cell.textLabel?.text = meme.topText
        cell.imageView?.image = meme.memedImage
        
        if let detailTextLabel = cell.detailTextLabel {detailTextLabel.text = meme.bottomText
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "SentViewDetailController") as! SentViewDetailController
        
        detailController.memes = self.allMemes[(indexPath as NSIndexPath).row]
        
        navigationController!.pushViewController(detailController, animated: true)
    }
    
}

