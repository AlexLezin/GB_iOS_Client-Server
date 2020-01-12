
//  Created by Евгений Никитин on 01.12.2019.
//  Copyright © 2019 Evel-Devel. All rights reserved.


import UIKit

class PhotoList: UICollectionViewController {
    
    
    // MARK: - Заглушка для фотографий
    
    var photoCollection = [1, 2, 3, 4, 5, 6, 7, 8]
    var user: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNavigationBar()
        print("\(user!) loaded")
    }
    
    
    // MARK: - Кастомизируем Navigation Bar (страница "Фотографии")
    func updateNavigationBar() {
        
        //Убираем надпись на кнопке возврата
        let backButtonItem = UIBarButtonItem()
        backButtonItem.title = ""
        backButtonItem.tintColor = .white
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButtonItem
    }
    
    
    // MARK: - Формирование ячеек и их вывод
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoCollection.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Photo", for: indexPath) as! PhotoCell
        return cell
    }
    
    
    // MARK: - Кнопка лайк
    @IBAction func likeButton(_ sender: Any) { (sender as! LikeButton).like() }
}
