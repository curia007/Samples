//
//  Error.swift
//  Notes
//
//  Created by Carmelo Uria on 5/1/22.
//

import Foundation

// Basic Swift Error definition

struct Error : LocalizedError
{
    var description : String = ""
    
    init(description : String)
    {
        self.description = description
    }
}
