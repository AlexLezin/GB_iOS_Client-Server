
//  Created by Евгений Никитин on 08.12.2019.
//  Copyright © 2019 Evel-Devel. All rights reserved.

import UIKit

class LikeButton: UIButton {
    
    // Пока что сделали настраиваемые параметры "поставлен лайк" и "количество"
    @IBInspectable var liked: Bool = false
    @IBInspectable var likeCount: Int = 0 { didSet { setupDefault() } }
    
    // Проверка 
    func like() {
        liked = !liked
        
        if liked {
            setLike()
        } else {
            disableLike()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDefault()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupDefault()
    }
    
    // Устанавливаем дефолтное состояние для кнопки
    private func setupDefault() {
        setImage(UIImage(named: liked ? "like" : "dislike"), for: .normal)
        setTitle(String(describing: likeCount), for: .normal)
        tintColor = .gray
        imageEdgeInsets = UIEdgeInsets(top: 3, left: -25, bottom: 3, right: 0)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: -55, bottom: 0, right: 0)
        imageView?.contentMode = .scaleAspectFit
    }
    
    // Ставим лайк
    private func setLike() {
        likeCount += 1
        setImage(UIImage(named: "like"), for: .normal)
        setTitle(String(describing: likeCount), for: .normal)
        tintColor = .red
        animatedLikeButton()
    }
    
    // Снимаем лайк
    private func disableLike() {
        likeCount -= 1
        setImage(UIImage(named: "dislike"), for: .normal)
        setTitle(String(describing: likeCount), for: .normal)
        tintColor = .gray
        animatedLikeButton()
    }
    
    // Прописываем анимацию для нажатия
    private func animatedLikeButton() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 1.1
        animation.toValue = 1
        animation.stiffness = 500
        animation.mass = 1
        animation.duration = 1
        animation.fillMode = CAMediaTimingFillMode.both
        layer.add(animation, forKey: nil)
        
        // Если нужно будет отложить - просто прибавим + "1/2/3" и т.д.
        //animation.beginTime = CACurrentMediaTime()
    }
}
