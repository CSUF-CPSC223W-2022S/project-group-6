//
//  locationPhotoController.swift
//  Project_Group_6
//
//  Created by csuftitan on 4/30/22.
//

import Foundation
import UIKit

class LocationPhotoController {
    
    func fetchPhotoInfo(at city: String, completion: @escaping (locationPhotoInfo?)->Void ){
        
        let baseURL = URL(string: "https://api.teleport.org/api/urban_areas/")
        
        guard let url = baseURL?.withSlug(city), let secureURL = url.withHTTPS() else {
            return
        }
        print(secureURL)
        // Create a request to retrieve data from the teleport server. The closure is called once the server replies to the request.
        let task = URLSession.shared.dataTask(with: secureURL) {
            (data, response, error) in
            // Decode the data into a PhotoInfo object.
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let locationphotoInfo = try? jsonDecoder.decode(locationPhotoInfo.self, from: data) {
                // Call the closure and pass the constructed PhotoInfo object.
                completion(locationphotoInfo)
            } else {
                print("Either no data was returned, or data was not properly decoded.")
                // Call the closure and pass nil when data cannot be retrieved or decoded.
                completion(nil)
            }
        }
        // Send the request
        task.resume()
    }

    func fetchImage(url: URL, completion: @escaping (UIImage?)->Void) {
        // Create a request to retrieve an image from the NASA server using the
        // photo URL.
        let task = URLSession.shared.dataTask(with: url) {
            (data,response, error) in
            /* Verify the image data is available and it can be used
               to create an image.
             */
            guard let imageData = data, let image = UIImage(data: imageData) else {
                // Call the completion closure and pass nil if data can not be loaded
                completion(nil)
                return
            }
            // Call the completion closure and pass the UIImage object if it is available
            completion(image)
        }
        // Send the request
        task.resume()
    }
}
