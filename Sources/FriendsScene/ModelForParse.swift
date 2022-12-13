//
//  ModelForParse.swift
//  
//
//  Created by Ivan Konishchev on 13.12.2022.
//

import Foundation

public final class ModelForParse:  Hashable {
    
    public static func == (lhs: ModelForParse, rhs: ModelForParse) -> Bool {
        return lhs.countFriends == rhs.countFriends &&
        lhs.userName == rhs.userName &&
        lhs.photo == rhs.photo &&
        lhs.id == rhs.id &&
        lhs.city == rhs.city &&
        lhs.lastSeenDate == rhs.lastSeenDate &&
        lhs.isClosedProfile == rhs.isClosedProfile &&
        lhs.isBanned == rhs.isBanned &&
        lhs.online == rhs.online &&
        lhs.status == rhs.status
    }
   public var countFriends = 0
   public var userName: String = ""
   public var photo: String = ""
   public var id: Int = 0
   public var city: String = ""
   public var lastSeenDate: Double = 0
   public var isClosedProfile: Bool = false
   public var isBanned: Bool = false
   public var online: Bool = false
   public var status: String = " "
    
    public func hash(into hasher: inout Hasher) {
        
    }
}
