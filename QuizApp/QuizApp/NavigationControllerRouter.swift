//
//  NavigationControllerRouter.swift
//  QuizApp
//
//  Created by Thomas on 2023/9/9.
//

import UIKit
import QuizEngine

class NavigationControllerRouter:Router{
    
    let navigationController:UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func routeTo(question:String,answerCallback:@escaping (String) -> Void){
        navigationController.pushViewController(UIViewController(), animated: false)
    }
    
    func routeTo(result: Result<String, String>) {
        
    }
    
}
