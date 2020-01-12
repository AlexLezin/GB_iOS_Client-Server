
//  Created by Евгений Никитин on 12.12.2019.
//  Copyright © 2019 Evel-Devel. All rights reserved.


import UIKit

enum CollectionCustomSize {
    case small
    case wide
}

// MARK: - (Вебинар №6)
class CustomCollectionViewLayout: UICollectionViewLayout {
    
    // Параметры ячеек (кол-во колонок, высота ячеек)
    var cacheAttributes = [IndexPath: UICollectionViewLayoutAttributes]()
    var columns = 2
    var cellHeight = 150
    var containerHeight: CGFloat = 0
    
    // Функция, которая собирает информацию о каждой ячейке
    override func prepare() {
        guard let collection = collectionView else { return }
        
        let itemsCount = collection.numberOfItems(inSection: 0)
        let commonWidth = collection.frame.width
        let smallWidth = collection.frame.width / CGFloat(columns)
        
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        // Цикл для отрисовки всех фотографий и расчета их размеров
        for element in 0..<itemsCount {
            let indexPath = IndexPath(item: element, section: 0)
            let attributeForIndex = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            // Проверяем какой тип ячейки, либо широкая - либо двойная маленькая
            let isWide: CollectionCustomSize = (element + 1) % (columns + 1) == 0 ? .wide : .small
            
            // В зависимости от проверки - выставляем параметры для ячейки
            switch isWide {
            case .wide:
                attributeForIndex.frame = CGRect(x: CGFloat(0),
                                                 y: y,
                                                 width: commonWidth,
                                                 height: CGFloat(cellHeight))
                y += CGFloat(cellHeight)
                
            case .small:
                attributeForIndex.frame = CGRect(x: x,
                                                 y: y,
                                                 width: smallWidth,
                                                 height: CGFloat(cellHeight))
                
                if (element + 2) % (columns + 1) == 0 || element == itemsCount - 1 {
                    y += CGFloat(cellHeight)
                    x = CGFloat(0)
                } else {
                    x = smallWidth
                }
            }
        
            cacheAttributes[indexPath] = attributeForIndex
        }
        
        containerHeight = y
    }
    
    // Рендерит конкретное значение атрибута для конкретного элемента под индексом
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cacheAttributes[indexPath]
    }
    
    // Определяем какие атрибуты находятся в области видимости
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cacheAttributes.values.filter {
            rect.intersects($0.frame)
        }
    }
    
    // Рассчитываем размер нашей коллекции (высоту контейнера)
    override var collectionViewContentSize: CGSize {
        return CGSize(width: collectionView!.frame.width, height: containerHeight)
    }
}
