//
//  extension1.swift
//  InventoryManagement
//
//  Created by Sujith on 22/08/22.
//

import Foundation
extension String{
    
    func validateEmailId() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return applyPredicateOnRegex(regexStr: emailRegEx)
    }
    
        func validatePassword()-> Bool {
                let passRegEx = "[a-zA-Z]{4}@[0-9]{3}"
            
        return applyPredicateOnRegex(regexStr: passRegEx)
    }
    
        
        
    func applyPredicateOnRegex(regexStr: String) -> Bool{
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateOtherString = NSPredicate(format: "SELF MATCHES %@", regexStr)
        let isValidateOtherString = validateOtherString.evaluate(with: trimmedString)
        return isValidateOtherString
    }
}
