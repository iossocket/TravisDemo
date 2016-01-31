//
//  SimpleValidationService.swift
//  TravisDemo
//
//  Created by Xueliang Zhu on 1/26/16.
//  Copyright © 2016 Xueliang Zhu. All rights reserved.
//

import UIKit

class SimpleValidationService: PValidationService {
    
    func userNameValidate(userName: String) -> ValidationErrorType {
        if userName.characters.count <= 0 {
            return .EmptyError
        }
        
        let mailPattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        let matcher: RegexHelper
        do {
            matcher = try RegexHelper(mailPattern)
        } catch {
            return .UserNameError
        }
        
        return matcher.match(userName) ? .NoError : .UserNameError
    }
    
    func passwordValidate(password: String) -> ValidationErrorType {
        let passwordCount = password.characters.count
        
        if passwordCount <= 0 {
            return .EmptyError
        } else if passwordCount <= 6 {
            return .PasswordMinError
        } else if passwordCount >= 10 {
            return .PasswordMaxError
        } else {
            return .NoError
        }
    }
}
