//
//  DetailViewController.swift
//  HWS-Milestone-Day-23
//
//  Created by Ade Dwi Prayitno on 02/12/23.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var image: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(shareCountry))
        
        if let image {
            imageView.image = UIImage(named: image)
        }
    }
    
    @objc func shareCountry() {
        guard
            let imageData = imageView.image?.jpegData(compressionQuality: 0.6),
            let countryName = image else {
            return
        }
        
        let vc = UIActivityViewController(activityItems: [imageData, countryName], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}
