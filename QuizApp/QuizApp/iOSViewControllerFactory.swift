//
//  iOSViewControllerFactory.swift
//  QuizApp
//
//  Created by Thomas on 2023/9/14.
//

import UIKit
import QuizEngine

class iOSViewControllerFactory:ViewControllerFactory{
    
    private let options:Dictionary<Question<String>,[String]>
    
    init(options: Dictionary<Question<String>, [String]>) {
        self.options = options
    }
    
    func questionViewController(for question: Question<String>, answerCallback: @escaping ([String]) -> Void) -> UIViewController {
        
        switch question {
        case .singleAnswer(let value):
            return QuestionViewController(question: value, options: options[question]!) { _ in }
        default:
            return UIViewController()
        }
        
        
       
    }
    
    func resultViewController(for result: QuizEngine.Result<Question<String>, [String]>) -> UIViewController {
        return UIViewController()
    }
    
    
}
