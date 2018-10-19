//
//  HeightDelegate.swift
//  PhotoPood
//
//  Created by Евгений on 19/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import UIKit

/// Делегат, устанавливающий высоту ячейки
protocol HeightDelegate {
    
    /// Устанавливают нужную высоту указанной ячейке
    ///
    /// - Parameters:
    ///   - height: Требуемая высота
    ///   - index: Индекс ячейки
    func setHeight(_ height: CGFloat, to index: IndexPath)
    
}
