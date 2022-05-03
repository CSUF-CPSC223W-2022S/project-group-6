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
    var seatMapInstance: seatMap?
    //  asset image
    private var imageCodeName: UIImage?
    //  imageView
    private var imageView: UIImageView?
    //  outlets
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var mapImage: UIImageView!
    @IBOutlet var navItem: UINavigationItem!
    @IBOutlet var popUpDisplay: UIView!
    @IBOutlet var blur: UIVisualEffectView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if seatMapTracker.list.isEmpty {
            seatMapInstance = nil
        } else {
            seatMapInstance = seatMapTracker.list[0]
        }
        view.backgroundColor = .systemBlue
        scrollView.delegate = self

        blur.bounds = view.bounds
        popUpDisplay.bounds = CGRect(x: 0, y: 0, width: view.bounds.width * 0.9, height: view.bounds.height * 0.4)
        loadImage()
        scrollView.contentSize = mapImage.frame.size
    }

    override func viewWillDisappear(_ animated: Bool) {
        _ = seatMapTracker.list.popLast()
    }

    func loadImage() {
        //  checks if the information that is passed in from the previous seatViewController is valid
        //  if so, create an image based on that name
        if let validSeatMap = seatMapInstance, validSeatMap.imageName != "" {
            navItem.title = "Seat Number: \(validSeatMap.seatNumber)"
            imageCodeName = UIImage(named: validSeatMap.imageName)
            mapImage.image = imageCodeName
        } else {
            createPopUp()
        }
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return mapImage
    }

    @IBAction func popUpButton(_ sender: Any) {
        // once they click the button on the popUp they are returned to the selection page
        _ = navigationController?.popViewController(animated: true)
    }

    //  Saves a seatMap class into the file SeatMaps.plist
    //  potentially will extend to save an array of them into the file
    @IBAction func saveImage(_ sender: Any) {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("SeatMaps").appendingPathExtension("plist")

        let propertyListEncoder = PropertyListEncoder()
        let encodedSeatMap = try? propertyListEncoder.encode(seatMapInstance)
        try? encodedSeatMap?.write(to: archiveURL, options: .noFileProtection)
    }

    private func createPopUp() {
        //  unhides the popUp
        blur.isHidden = false
        popUpDisplay.isHidden = false
    }
}
