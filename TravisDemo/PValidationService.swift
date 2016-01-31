//
//  PValidationService.swift
//  TravisDemo
//
//  Created by Xueliang Zhu on 1/26/16.
//  Copyright © 2016 Xueliang Zhu. All rights reserved.
//

import UIKit

enum ValidationErrorType: String {
    case EmptyError = "Input can not be empty"
    case UserNameError = "User name should be email"
    case PasswordMinError = "Password should more than 6 characters"
    case PasswordMaxError = "Password should less than 10 characters"
    case NoError = "Success"
}

protocol PValidationService {
    func userNameValidate(userName: String) -> ValidationErrorType
    func passwordValidate(password: String) -> ValidationErrorType
}
