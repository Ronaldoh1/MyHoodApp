//
//  ViewController.swift
//  MyHoodApp
//
//  Created by Ronald Hernandez on 2/11/16.
//  Copyright © 2016 Solstice. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var postsArray = [Post]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var post = Post(imagePath: "", title: "Post 1", description: "description")
        var post2 = Post(imagePath: "", title: "Post 2", description: "description 2")
        var post3 = Post(imagePath: "", title: "Post 3", description: " the read deal")
        
        postsArray.append(post)
        postsArray.append(post2)
        postsArray.append(post3)
        
        tableView.reloadData()
    }


 //Mark - Delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return postsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let identifier = "cell"
        
        let post:Post = postsArray[indexPath.row] as Post
        
        //if there is cell available to reuse.
        if let cell: PostCell = tableView.dequeueReusableCellWithIdentifier(identifier) as?PostCell {
           cell.configureCell(post)
            
            return cell
            
        }else {
          
        //if there is no cell available. Create a new cell.
            let cell = PostCell()
            cell.configureCell(post)
            return cell
            
        }
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 84.0
    }

}

