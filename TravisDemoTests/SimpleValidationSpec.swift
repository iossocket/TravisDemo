//
//  SimpleValidationSpec.swift
//  TravisDemo
//
//  Created by Xueliang Zhu on 1/26/16.
//  Copyright © 2016 Xueliang Zhu. All rights reserved.
//

import Quick
import Nimble

class SimpleValidationSpec: QuickSpec {
    override func spec() {
        describe("userNameValidate") {
            
            var validationService: PValidationService!
            beforeEach {
                validationService = SimpleValidationService()
            }
            
            it("should return empty error") {
                let result = validationService.userNameValidate("")
                expect(result).to(equal(ValidationErrorType.EmptyError))
            }
            
            it("should return user name error") {
                let result = validationService.userNameValidate("aa")
                expect(result).to(equal(ValidationErrorType.UserNameError))
            }
            
            it("should return no error") {
                let result = validationService.userNameValidate("aa@126.com")
                expect(result).to(equal(ValidationErrorType.NoError))
            }
        }
        
        describe("passwordValidate") {
            var validationService: PValidationService!
            beforeEach {
                validationService = SimpleValidationService()
            }
            
            it("should return empty error") {
                let result = validationService.passwordValidate("")
                expect(result).to(equal(ValidationErrorType.EmptyError))
            }
            
            it("should return password min error") {
                let result = validationService.passwordValidate("123")
                expect(result).to(equal(ValidationErrorType.PasswordMinError))
            }
            
            it("should return no error") {
                let result = validationService.passwordValidate("12345678")
                expect(result).to(equal(ValidationErrorType.NoError))
            }
        }
    }
}
