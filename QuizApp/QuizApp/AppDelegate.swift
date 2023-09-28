//
//  AppDelegate.swift
//  QuizApp
//
//  Created by Thomas on 2023/8/31.
//

import UIKit
//import QuizEngine

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
//    var game:Game<Question<String>,Set<String>,NavigationControllerRouter>?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        let question = Question.singleAnswer("What's Mike's nationality?")
//        let questions = [question]
//
//        let option1 = "Canadian"
//        let option2 = "American"
//        let option3 = "Greek"
//        let options = [option1,option2,option3]
//
//        let correctAnswers = [question:Set([option3])]
//
//        let navigationController = UINavigationController()
//        let factory = iOSViewControllerFactory(questions: questions, options: [question:options], correctAnswers: correctAnswers)
//        let router = NavigationControllerRouter(navigationController, factory: factory)
//
//
//        window = UIWindow(frame: UIScreen.main.bounds)
//
//        window?.rootViewController = navigationController
//        window?.makeKeyAndVisible()
//
//        game = startGame(questions: questions, router: router, correctAnswers: correctAnswers)
//
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
}

