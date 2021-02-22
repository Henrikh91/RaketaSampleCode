//
//  HTTPURLResponseWithMimeType.swift
//  RaketaSampleCode
//
//  Created by hvk on 16.02.2021.
//

import Foundation

extension HTTPURLResponse {
    
    private enum StatusCode: Int {
        case success = 200
    }
    
    func imageData() -> Bool {
        
        guard
            statusCode == StatusCode.success.rawValue,
            let mimeType = self.mimeType,
            mimeType.isImageMimeType()
        else {
            return false
        }
        
        return true
    }
}
