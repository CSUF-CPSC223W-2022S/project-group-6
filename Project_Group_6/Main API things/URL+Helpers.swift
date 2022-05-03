//
//  URL+Helpers.swift
//  Project_Group_6
//
//  Created by csuftitan on 4/30/22.
//

import Foundation
extension URL {
    
    /// Add queries to the URL
    /// - Parameter queries: map of queries
    /// - Returns: URL with the added queries or nil if the produced URL is valid
    func withQueries(_ queries: [String: String]) -> URL? {
        // Extract the components of the URL
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        /* Create an array from the queries parameter that contains
           URLQueryItem objects. The object's name and value are
           taken from one element of the queries dictionary. The
           .0 property indicates the key and .1 indicates the value
           of the dictionary. */
        components?.queryItems = queries.map {
            URLQueryItem(name: $0.0, value: $0.1)
        }
        return components?.url
    }
    
    
    /// Changes a URL's scheme to HTTPS
    ///
    /// HTTPS stands for Hypertext Transfer Protocol Secure, which is the preferred protocol
    /// to ensure security.
    /// - Returns: URL with the HTTPS scheme
    func withHTTPS() -> URL? {
        // Extract the components of the URL
        var components = URLComponents(url: self,
                                       resolvingAgainstBaseURL: true)
        components?.scheme = "https"
        return components?.url
    }
    func withSlug(_ nameOfLocation: String) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        let dashedLocation = nameOfLocation.replacingOccurrences(of: " ", with: "-")
        
        components?.path.append("slug:\(dashedLocation.lowercased())/images/")
        return components?.url
    }
}
