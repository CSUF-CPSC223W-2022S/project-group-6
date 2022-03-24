//
//  mapViewController.swift
//  Project_Group_6
//
//  Created by Diego on 3/20/22.
//

import UIKit

class mapViewController: UIViewController {
    //  tracks seat map information across different view controllers
    var seatMapTracker: SeatMapTracker!
    //  asset image
    private var imageCodeName: UIImage?
    //  imageView
    private var imageView: UIImageView?
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
        let imageName = seatMapTracker.list[0].getSeatMap()
        //if let validImageName = seatinformation?.title {
        //    imageCodeName = UIImage(named: validImageName)
        //}
        imageCodeName = UIImage(named: imageName)
        //if let image = imageCodeName {
            //  creates an image view based on the image
        //    imageView = UIImageView(image: image)
            //  adds the image to the screen
        //    if let validImageView = imageView {
         //       mapImage.addSubview(validImageView)
         //   }
       // }
        imageView = UIImageView(image: imageCodeName)
        if let validImageView = imageView {
            mapImage.addSubview(validImageView)
        }
        let delete = seatMapTracker.list.popLast()
        //debugPrint(seatinformation.title!)
        //debugPrint(mapImage.image!.debugDescription)
    }
}
