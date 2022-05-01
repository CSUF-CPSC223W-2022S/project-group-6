//
//  ViewController.swift
//  Project_Group_6
//
//  Created by csuftitan on 2/17/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var Image: UIImageView!
    
    @IBOutlet var cityName: UILabel!
    
    let cities: [String] = [
        "Los Angeles",
        "Paris",
        "Chicago",
        "Las Vegas",
        "Philadephia",
        "New Orleans",
        "London",
        "Dubai",
        "San Francisco Bay Area",
        "Singapore",
        "New York",
        "Istanbul",
        "Bangkok",
        "Kuala Lumpur"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cityName.text = cities.randomElement()
        updateImage()
    }
    func updateImage() {
        let lpcIfno = LocationPhotoController()
        guard let city = cityName.text else {return}
        lpcIfno.fetchPhotoInfo(at: city) { (info) in
        
            DispatchQueue.main.async {
                // Verify that photo information is available
                guard let photoInfo = info else {
                    print("did not set photoInfo")
                    return
                }
                
                guard let imageString = photoInfo.photos[0]["image"]?["mobile"] else {return}
                guard let imageUrl = URL(string: imageString) else {return}
                lpcIfno.fetchImage(url: imageUrl) {
                    (image)-> Void in
                    /* Run the code on the main thread so the application continues to
                       run while waiting for the code block to complete.
                     */
                    DispatchQueue.main.async {
                        /* Verify the image data is available and it's format can be used
                           to create an image.
                         */
                        guard let theImage = image else { return }
                        // Update image on the interface if available
                        self.Image.image = theImage
                    }
                }
            }
        }
    }
}
