//
//  AppDelegate.swift
//  QuizApp
//
//  Created by Thomas on 2023/8/31.
//

import UIKit
import QuizEngine

//@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var quiz:Quiz?
    
    private lazy var navigationController = UINavigationController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        startNewQuiz()
        
        return true
    }

    private func startNewQuiz(){
        let factory = iOSUIKitViewControllerFactory(
            options: demoQuiz.options,
            correctAnswers: demoQuiz.correctAnswers
        )
        let router = NavigationControllerRouter(navigationController, factory: factory)
        quiz = Quiz.start(questions: demoQuiz.questions, delegate: router)
    }
}

