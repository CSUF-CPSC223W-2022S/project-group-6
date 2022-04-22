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
    var seatMapInstance: seatMap!
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
        view.backgroundColor = .systemBlue
        scrollView.delegate = self
        
        seatMapInstance = seatMapTracker.list[0]
        blur.bounds = view.bounds
        popUpDisplay.bounds = CGRect(x: 0, y: 0, width: view.bounds.width * 0.9, height: view.bounds.height * 0.4)
        loadImage()
        scrollView.contentSize = mapImage.frame.size

    }

    func loadImage() {
        //  checks if the information that is passed in from the previous seatViewController is valid
        //  if so, create an image based on that name
        let imageName = seatMapInstance.getSeatMap()
        //  ensures the asset can be accessed via a non empty string by guarding that the imageName is empty
        guard imageName != "" else {
            debugPrint("Seat map doesnt exists: display pop up to return to seatViewController")
            //  pops it off here because it wont be able to go pass the return statement
            _ = seatMapTracker.list.popLast()
            
            blur.isHidden = false 
            //animateOut(desiredView: blur)
            popUpDisplay.isHidden = false
            //animateOut(desiredView: popUpDisplay)
            return
        }
        navItem.title = "Seat Number: \(seatMapInstance.seatNumber)"
//        debugPrint(seatMapTracker.list[0].starting)
//        debugPrint(seatMapTracker.list[0].destination)
//        debugPrint(seatMapTracker.list[0].airline)
//        debugPrint(imageName)
        
        imageCodeName = UIImage(named: imageName)
        
        mapImage.image = imageCodeName
        
        _ = seatMapTracker.list.popLast()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return mapImage
    }
    @IBAction func popUpButton(_ sender: Any) {
//        debugPrint("Pop up button was clicked: return to previous page.")
        // once they click the button on the popUp they are returned to the selection page
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func saveImage(_ sender: Any) {
        debugPrint("Image Saved!")
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("SeatMaps").appendingPathExtension("plist")
        
        let propertyListEncoder = PropertyListEncoder()
        let encodedSeatMap = try? propertyListEncoder.encode(seatMapInstance)
        try? encodedSeatMap?.write(to: archiveURL, options: .noFileProtection)

    }
//    @IBAction func loadSavedImage(_ sender: Any) {
//        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        let archiveURL = documentsDirectory.appendingPathComponent("SeatMaps").appendingPathExtension("plist")
//        let propertyListDecoder = PropertyListDecoder()
//        if let retrievedData = try? Data(contentsOf: archiveURL), let decodedSeatMap = try? propertyListDecoder.decode(seatMap.self, from: retrievedData) {
//            seatMapInstance = decodedSeatMap
//            loadImage()
//        }
//        debugPrint("Loaded image in from file")
//    }
}
