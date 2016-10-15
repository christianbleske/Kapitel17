//
//  ImageLoader.swift
//  NSOperationBsp
//
//  Created by Christian Bleske on 31.12.15.
//  Copyright © 2015 Christian Bleske. All rights reserved.
//

import Foundation
import UIKit

class ImageLoader {
    class func loadImageFromURL(_ url:String) -> UIImage! {
        let nsData = try? Data(contentsOf: URL(string: url)!)
        return UIImage(data: nsData!)
    }
}
