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
        DataService.instance.loadedPosts
     NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPostsLoaded:", name: "onPostsLoaded", object: nil)
        
        tableView.reloadData()
        
        print(DataService.instance.loadedPosts.count)
    }


  //Mark - Notifications
    func onPostsLoaded(notif: AnyObject){
        tableView.reloadData()
    }
 //Mark - Delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DataService.instance.loadedPosts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let identifier = "cell"
        
        let post = DataService.instance.loadedPosts[indexPath.row]
        
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

