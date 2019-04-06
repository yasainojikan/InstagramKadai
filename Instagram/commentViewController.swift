//
//  commentViewController.swift
//  Instagram
//
//  Created by 今冨友裕 on 2019/04/01.
//  Copyright © 2019年 yasainojikan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class commentViewController: UIViewController {
    
    var postData: PostData!
    
    var displayComment: [String?] = []
    
    @IBOutlet weak var commentEditTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // commentEditTextField.text = postData.commen
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveCommentButton(_ sender: Any) {
        // textFieldに表示されているコメントを上書き保存する
        if commentEditTextField.text != "" {
            let submitName = Auth.auth().currentUser!.displayName!
            if postData.comment.isEmpty == false {
                // let displayComment =  postData.comment! + "\n" + submitName + ":" + commentEditTextField.text!
                displayComment = postData.comment
                let savedComment: String = submitName + ":" + commentEditTextField.text! + "\n"
                displayComment.append(savedComment)
                let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
                let postComment = ["comment": displayComment]
                postRef.updateChildValues(postComment)
                print("\(displayComment)")
            } else {
                // let displayComment = submitName + ":" + commentEditTextField.text!
                let savedComment: String = submitName + ":" + commentEditTextField.text! + "\n"
                displayComment = [savedComment]
                let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
                let postComment = ["comment": displayComment]
                postRef.updateChildValues(postComment)
                print("emptyです")
            }
            dismiss(animated: true, completion: nil)
            
        } else {
            dismiss(animated: true, completion: nil)
            print("空です")
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
