//
//  ImageViewWithDownloader.swift
//  RaketaSampleCode
//
//  Created by hvk on 16.02.2021.
//

import UIKit

extension UIImageView {
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        
        contentMode = mode
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard
                error == nil,
                let httpURLResponse = response as? HTTPURLResponse,
                httpURLResponse.imageData(),
                let data = data,
                let image = UIImage(data: data)
            else {
                return
            }
            
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func downloaded(from link: String?, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        
        guard
            let string = link,
            let url = URL(string: string)
        else {
            return
        }
        
        downloaded(from: url, contentMode: mode)
    }
}
