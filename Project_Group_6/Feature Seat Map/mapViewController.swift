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
        let imageName = seatMapTracker.list[0].getSeatMap()
        
        imageCodeName = UIImage(named: imageName)
        
        mapImage.image = imageCodeName
        
        seatMapTracker.list.popLast()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return mapImage
    }
    
}
