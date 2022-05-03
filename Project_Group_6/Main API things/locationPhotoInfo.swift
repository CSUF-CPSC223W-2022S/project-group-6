//
//  locationPhotoInfo.swift
//  Project_Group_6
//
//  Created by csuftitan on 4/30/22.
//

import Foundation

struct locationPhotoInfo: Codable {
    //  type: array of dictionaryContainer with key = String and value = Another dictionary with key = string, value = string
    /*  [ //ARRAY
    {// DICTIONARY
      "attribution"//KEY//: //VALUE//{
        //ANOTHER DICTIONARY//
        "license": "Attribution, ShareAlike",
        "photographer": "Lucas Theis",
        "site": "Unsplash",
        "source": "https://unsplash.com/lucastheis"
      },
     //INDEX 1 OF ARRAY
        //DICTIONARY
      "image"//KEY//: //VALUE//{
        "mobile": "https://d13k13wj6adfdf.cloudfront.net/urban_areas/San_Francisco_9q8yy-68f5c7173b.jpg",
        "web": "https://d13k13wj6adfdf.cloudfront.net/urban_areas/San_Francisco_9q8yy_web-9a4042d87e@3x.jpg"
      }
    }
  ]*/
    var photos: [ [String : [String: String] ]  ]
    
    enum LocationCodingKeys: CodingKey {
        case photos
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy:
           CodingKeys.self)
        self.photos = try valueContainer.decode(Array<Dictionary<String, Dictionary<String, String>>>.self, forKey: .photos)
    }
}
  
