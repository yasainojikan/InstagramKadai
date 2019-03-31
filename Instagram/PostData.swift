//
//  PostData.swift
//  Instagram
//
//  Created by 今冨友裕 on 2019/03/25.
//  Copyright © 2019年 yasainojikan. All rights reserved.
//

import Foundation

import UIKit
import Firebase
import FirebaseDatabase

class PostData: NSObject {
    var id: String?
    var image: UIImage?
    var imageString: String?
    var name: String?
    var caption: String?
    var date: Date?
    var likes: [String] = []
    var isLiked: Bool = false
    var comment: String?
    
    init(snapshot: DataSnapshot, myId: String) {
        // 投稿のID
        self.id = snapshot.key
        
        // valueプロパティに入っているデータを取り出すインスタンスを定義
        let valueDictionary = snapshot.value as! [String: Any]
        
        // 画像
        imageString = valueDictionary["image"] as? String
        image = UIImage(data: Data(base64Encoded: imageString!, options: .ignoreUnknownCharacters)!)
        
        // 投稿者名
        self.name = valueDictionary["name"] as? String
        
        // キャプション
        self.caption = valueDictionary["caption"] as? String
        
        // 日付
        let time = valueDictionary["time"] as? String
        self.date = Date(timeIntervalSinceReferenceDate: TimeInterval(time!)!)
        
        // いいねをした人のIDの配列
        if let likes = valueDictionary["likes"] as? [String] {
            self.likes = likes
        }
        
        // 自分がいいねしたかどうかのフラグ
        for likeId in self.likes {
            if likeId == myId {
                self.isLiked = true
                break
            }
        }
       // コメント
        self.comment = valueDictionary["comment"] as? String
    }
    
}
