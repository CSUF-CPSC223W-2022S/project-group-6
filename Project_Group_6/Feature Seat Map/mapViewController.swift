//
//  mapViewController.swift
//  Project_Group_6
//
//  Created by Diego on 3/20/22.
//

import UIKit

class mapViewController: UIViewController {
    //  asset image
    private var imageCodeName: UIImage?
    //  outlets
    @IBOutlet var mapImage: UIImageView!
    @IBOutlet var seatinformation: UINavigationItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        loadImage()
    }

    func loadImage() {
        //  checks if the information that is passed in from the previous seatViewController is valid
        //  if so, create an image based on that name
        if let validImageName = seatinformation?.title {
            imageCodeName = UIImage(named: validImageName)
        }
        if let image = imageCodeName {
            //  creates an image view based on the image
            mapImage = UIImageView(image: image)
            //  adds the image to the screen
            view.addSubview(mapImage)
        }
        debugPrint(seatinformation.title!)
        debugPrint(mapImage.image!.debugDescription)
    }
}
