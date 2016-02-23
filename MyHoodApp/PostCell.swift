//
//  PostCell.swift
//  MyHoodApp
//
//  Created by Ronald Hernandez on 2/14/16.
//  Copyright © 2016 Solstice. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        postImage.layer.cornerRadius = postImage.frame.size.width / 2
        postImage.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(post: Post){
        titleLabel.text = post.title
        descriptionLabel.text = post.postDescription
    
        postImage.image = DataService.instance.imageForPath(post.imagePath)
        
    }

}
