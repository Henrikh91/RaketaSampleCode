//
//  StringWithMimeType.swift
//  RaketaSampleCode
//
//  Created by hvk on 16.02.2021.
//

import Foundation

extension String {
    
    private enum MimeType: String {
        case image
    }

    func isImageMimeType() -> Bool {
        hasPrefix(MimeType.image.rawValue)
    }
}
