//
//  FlagViewController.swift
//  HackingWithSwiftDay23
//
//  Created by Muhammed Yılmaz on 2.11.2024.
//

import UIKit

class FlagViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var selectFlag : String?
    var nameFlag : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareButton))
        
        title = nameFlag
        if let flag = selectFlag {
            imageView.image = UIImage(named: flag)
        }
    }
    
    @objc func shareButton() {
        let activityViewController = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: nil)
        present(activityViewController, animated: true)
    }

}
