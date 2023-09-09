//
//  NavigationControllerRouter.swift
//  QuizApp
//
//  Created by Thomas on 2023/9/9.
//

import UIKit
import QuizEngine



protocol ViewControllerFactory{
    func questionViewController(for question:String,answerCallback:@escaping (String) -> Void) -> UIViewController
}

class NavigationControllerRouter:Router{
    
    private let navigationController:UINavigationController
    private let factory:ViewControllerFactory
    
    init(_ navigationController: UINavigationController,factory:ViewControllerFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func routeTo(question:String,answerCallback:@escaping (String) -> Void){
        let viewController = factory.questionViewController(for: question, answerCallback: answerCallback)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func routeTo(result: Result<String, String>) {
        
    }
    
}
