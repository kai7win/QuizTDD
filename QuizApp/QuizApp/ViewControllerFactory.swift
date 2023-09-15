//
//  ViewControllerFactory.swift
//  QuizApp
//
//  Created by Thomas on 2023/9/14.
//

import UIKit
import QuizEngine

protocol ViewControllerFactory{
    func questionViewController(for question:Question<String>,answerCallback:@escaping ([String]) -> Void) -> UIViewController
    
    func resultViewController(for result:Result<Question<String>,[String]>) -> UIViewController
}
