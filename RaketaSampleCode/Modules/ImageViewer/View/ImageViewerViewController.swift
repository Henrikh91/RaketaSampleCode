//
//  ImageViewerViewController.swift
//  RaketaSampleCode
//
//  Created by hvk on 22.02.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class ImageViewerViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet private(set) var imageView: UIImageView!
    @IBOutlet private(set) var scrollView: UIScrollView!
    @IBOutlet private(set) var saveButton: UIButton!

    // MARK: - Public properties

    var presenter: ImageViewerPresenting!

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
}

// MARK: - Ibactions

extension ImageViewerViewController {

    @IBAction func didTouchSave() {
        presenter.didTouchSave()
    }
}

// MARK: - View logic

extension ImageViewerViewController: ImageViewerView {
    
    func update(thumbnailImage: UIImage?) {
        imageView.image = thumbnailImage
        saveButton.isEnabled = true
    }
}

// MARK: - UIScrollViewDelegate

extension ImageViewerViewController: UIScrollViewDelegate {

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
