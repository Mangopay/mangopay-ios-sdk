//
//  File.swift
//  
//
//  Created by Elikem Savie on 18/10/2022.
//

import Foundation
import ApolloAPI
import Apollo
import SchemaPackage

extension String {
    
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
}

extension String {
    func toGraphQLNullable() -> GraphQLNullable<String> {
        return GraphQLNullable<String>(stringLiteral: self)
    }
}
