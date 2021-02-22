//
//  ImageViewer.Presenter.swift
//  RaketaSampleCode
//
//  Created by hvk on 22.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ImageViewerPresenting: AnyObject {

    func viewDidLoad()
    
    func didTouchSave()
}

extension ImageViewer {

    final class Presenter {

        // MARK: - Public properties

        weak var view: ImageViewerView!
        var router: ImageViewerRouting!
        var interactor: ImageViewerInteracting!
        var thumbnail: String!
        var image: UIImage?
    }
}

// MARK: - Presentation logic

extension ImageViewer.Presenter: ImageViewerPresenting {

    func viewDidLoad() {

        API.shared.downloaded(from: thumbnail) { [weak self] (result) in
            
            guard let self = self else {
                return
            }
            
            switch result {
            
            case .success(let data):
                
                self.image = UIImage(data: data)
                
                DispatchQueue.main.async {
                    self.view?.update(thumbnailImage: self.image)
                }
            case .failure:
                break
            }
        }
    }
    
    func didTouchSave() {
        
        guard let image = self.image else {
            return
        }
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}

// MARK: - ImageViewerInteractorOutput

extension ImageViewer.Presenter: ImageViewerInteractorOutput { }
