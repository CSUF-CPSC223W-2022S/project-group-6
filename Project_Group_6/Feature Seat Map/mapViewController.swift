//
//  mapViewController.swift
//  Project_Group_6
//
//  Created by Diego on 3/20/22.
//

import UIKit

class mapViewController: UIViewController, UIScrollViewDelegate {
    //  tracks seat map information across different view controllers
    var seatMapTracker: SeatMapTracker!
    //  asset image
    private var imageCodeName: UIImage?
    //  imageView
    private var imageView: UIImageView?
    //  outlets
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var mapImage: UIImageView!
    @IBOutlet var navItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        scrollView.delegate = self
        loadImage()
        scrollView.contentSize = mapImage.frame.size

    }

    func loadImage() {
        //  checks if the information that is passed in from the previous seatViewController is valid
        //  if so, create an image based on that name
        navItem.title = "Seat Number \(seatMapTracker.list[0].seatNumber)"
        let imageName = seatMapTracker.list[0].getSeatMap()
        debugPrint(seatMapTracker.list[0].starting)
        debugPrint(seatMapTracker.list[0].destination)
        debugPrint(seatMapTracker.list[0].airline)
        debugPrint(imageName)
        
        imageCodeName = UIImage(named: imageName)
        
        mapImage.image = imageCodeName
        
        _ = seatMapTracker.list.popLast()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return mapImage
    }
    
}
