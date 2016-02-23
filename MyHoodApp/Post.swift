//
//  Post.swift
//  MyHoodApp
//
//  Created by Ronald Hernandez on 2/11/16.
//  Copyright © 2016 Solstice. All rights reserved.
//

import Foundation

class Post : NSObject, NSCoding {
    
    private var _imagePath: String!
    private var _title: String!
    private var _postDescription: String!
    
    
    var imagePath: String {
        return _imagePath
    }
    var title: String{
        return _title
    }
    var postDescription: String {
        return _postDescription
    }
    
    override init() {
        
    }
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._postDescription = aDecoder.decodeObjectForKey("description") as! String
    }
    
    init(imagePath: String, title: String, description: String){
        
        self._imagePath = imagePath
        self._title = title
        self._postDescription = description
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._imagePath, forKey:"imagePath")
        aCoder.encodeObject(self._title, forKey: "title")
        aCoder.encodeObject(self.postDescription, forKey: "description")
    }
    
    

    
}
