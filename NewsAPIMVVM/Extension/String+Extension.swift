//
//  String+Extension.swift
//  NewsAPIMVVM
//
//  Created by Ahmet Karamanoğlu on 7.03.2024.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
