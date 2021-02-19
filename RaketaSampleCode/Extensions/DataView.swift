//
//  DataView.swift
//  RaketaSampleCode
//
//  Created by hvk on 16.02.2021.
//

import Foundation

protocol DataView: AnyObject {
    associatedtype ViewModelType
    func fill(with viewModel: ViewModelType)
}
