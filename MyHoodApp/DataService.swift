//
//  DataService.swift
//  MyHoodApp
//
//  Created by Ronald Hernandez on 2/21/16.
//  Copyright © 2016 Solstice. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    
    static let instance = DataService()
    
    private var _loadedPosts = [Post]()
    let KEY_POSTS = "posts"
    
    var loadedPosts: [Post] {
        return _loadedPosts
    }
    
    func savePosts(){
        //convert out array to data
        let postsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPosts)
        
        NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: KEY_POSTS)
        NSUserDefaults.standardUserDefaults().synchronize()
        
    
    }
    
    func loadPosts(){
        if let postsData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_POSTS) as? NSData {
            
            if let postArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [Post] {
                _loadedPosts = postArray
            }
            
        }
        //set up a notification to let everyone who needs to know that the data has loaded. 
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "onPostsLoaded", object: nil))
        
        
    }
    
    
    func saveImageAndCreatePath(image: UIImage) -> String {
        
        let imageData = UIImagePNGRepresentation(image)
        
        let imagePath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFileName(imagePath)
        
        imageData?.writeToFile(fullPath, atomically: true)
        
        return imagePath
        
        
    }
    
    func imageForPath(path: String) -> UIImage?{
        
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        
        return image
    }
    
    func addPost(post: Post){
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    
    func documentsPathForFileName(name: String) -> String {
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = path[0] as NSString
        
        return fullPath.stringByAppendingPathComponent(name)
    }
}

//user singletons only when needed, they never get destroyed. 
