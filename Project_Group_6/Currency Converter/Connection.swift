//
//  Connection.swift
//  Project_Group_6
//
//  Created by Marco Gabriel on 4/7/22.
//

import Foundation
import SystemConfiguration
import UIKit

// function that will notify if you are disconnected from the internet
// returns a bool
func isInternetAvailable() -> Bool {
    //
    var zeroAddress = sockaddr_in()
    // UInt8 - an 8-bit unsigned int value type
    //
    zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
    zeroAddress.sin_family = sa_family_t(AF_INET)

    let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
        $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { zeroSockAddress in
            SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
        }
    }

    var flags = SCNetworkReachabilityFlags()
    if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
        return false
    }
    let isReachable = flags.contains(.reachable)
    let needsConnection = flags.contains(.connectionRequired)
    return (isReachable && !needsConnection)
}
