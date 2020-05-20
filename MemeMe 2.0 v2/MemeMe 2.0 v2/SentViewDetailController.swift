//
//  SentViewDetailController.swift
//  MemeMe 2.0 v2
//
//  Created by James Miller on 5/6/20.
//  Copyright © 2020 James Miller. All rights reserved.
//

import UIKit

class SentViewDetailController: UIViewController {

    var memes: Meme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memedImageDisplay.image = memes.memedImage
        
    }

    
    
    @IBOutlet weak var memedImageDisplay: UIImageView!
    
    //override func viewDidLoad() {
    //    super.viewDidLoad()
    //    memedImageDisplay.image = meme.memedImage
    //}
    
 
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
