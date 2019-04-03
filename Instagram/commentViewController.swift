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
   
    @IBOutlet weak var commentEditTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        commentEditTextField.text = postData.comment
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveCommentButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
