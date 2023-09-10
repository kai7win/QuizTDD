//
//  Result.swift
//  QuizEngine
//
//  Created by Thomas on 2023/9/9.
//

import Foundation

public struct Result<Question:Hashable,Answer>{
    
    public let answers:[Question:Answer]
    public let score:Int

}

