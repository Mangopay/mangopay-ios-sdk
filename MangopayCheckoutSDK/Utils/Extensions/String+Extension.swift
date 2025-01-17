//
//  File.swift
//  
//
//  Created by Elikem Savie on 18/10/2022.
//

import Foundation

extension String {

    var isBackspace: Bool {
      let char = self.cString(using: String.Encoding.utf8)!
      return strcmp(char, "\\b") == -92
    }

    func isMatch(_ Regex: String) -> Bool {
        
        do {
            let regex = try NSRegularExpression(pattern: Regex)
            let results = regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }.count > 0
        } catch {
            return false
        }
        
    }
    
    func fromBase64() -> String {
        let base64Decode = Data(base64Encoded: self)!
        return String(data: base64Decode, encoding: .utf8)!
    }

    func trimCard() -> String {
        self.replacingOccurrences(of: " ", with: "")
    }
}

extension String {
//    func toGraphQLNullable() -> GraphQLNullable<String> {
//        return GraphQLNullable<String>(stringLiteral: self)
//    }
}
