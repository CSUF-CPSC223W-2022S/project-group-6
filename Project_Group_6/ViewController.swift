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
    
    var animationTimer: Timer?
    
    let cities: [String] = [
        "Los Angeles",
        "Paris",
        "Chicago",
        "Las Vegas",
        "Philadelphia",
        "New Orleans",
        "London",
        "Dubai",
        "Tokyo",
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
    }

    override func viewWillAppear(_ animated: Bool) {
        if isInternetAvailable() {
            setUpImage()
            animationTimer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) {
                _ in
                UIView.transition(with: self.cityName, duration: 1, options: .transitionCrossDissolve, animations: {
                    let oldName = self.cityName.text
                    self.cityName.text = self.cities.randomElement()
                    if oldName == self.cityName.text {
                        self.cityName.text = self.cities.randomElement()
                    }
                }, completion: nil)
                self.updateImage()
            }
        } else {
            setUpImage()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        if let timer = animationTimer {
            timer.invalidate()
        }
    }

    func updateImage() {
        let lpcIfno = LocationPhotoController()
        guard let city = cityName.text else { return }
        lpcIfno.fetchPhotoInfo(at: city) { info in
        
            DispatchQueue.main.async {
                // Verify that photo information is available
                guard let photoInfo = info else {
                    print("did not set photoInfo")
                    return
                }
                
                guard let imageString = photoInfo.photos[0]["image"]?["mobile"] else { return }
                guard let imageUrl = URL(string: imageString) else { return }
                lpcIfno.fetchImage(url: imageUrl) {
                    image in
                    /* Run the code on the main thread so the application continues to
                       run while waiting for the code block to complete.
                     */
                    DispatchQueue.main.async {
                        /* Verify the image data is available and it's format can be used
                           to create an image.
                         */
                        guard let theImage = image else { return }
                        // Update image on the interface if available
                        UIView.transition(with: self.Image, duration: 2.5, options: .transitionFlipFromRight, animations: {
                            self.Image.image = theImage
                        }, completion: nil)
                    }
                }
            }
        }
    }

    func setUpImage() {
        if Image != nil {
            Image.layer.masksToBounds = true
            Image.layer.cornerRadius = 135
            Image.clipsToBounds = true
        }
    }
}
