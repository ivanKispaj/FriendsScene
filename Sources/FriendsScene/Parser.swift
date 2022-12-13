//
//  Parser.swift
//  
//
//  Created by Ivan Konishchev on 13.12.2022.
//

import Foundation
import FriendsModel
final class Parser {

    func parseResponse(from response: FriendsResponse, completion: @escaping([ModelForView]) -> Void) {
        var arrays = [ModelForParse]()
        let items = response.items
        for friendData in items {
            let friends = ModelForParse()
            friends.countFriends = response.countFriends
            if friendData.online == 1 {
                friends.online = true
            }
            
            if friendData.banned != nil {
                friends.isBanned = true
            }
            
            if friendData.city != nil {
                friends.city = friendData.city!.title
            } else {
                friends.city = "unknown"
            }
            
            if friendData.lastSeen != nil {
                friends.lastSeenDate = friendData.lastSeen!.time
            }
            
            if  let status = friendData.status {
                friends.status = status
            }
            
            let name = (friendData.fName) + " " + (friendData.lName)
            friends.userName = name
            friends.id = friendData.id
            friends.photo = friendData.photo50
            friends.isClosedProfile = friendData.isClosedProfile
            arrays.append(friends)
        }
        
        
        completion(self.parseForView(from: arrays))
    }
    private func parseForView(from modelParse: [ModelForParse]) -> [ModelForView] {
        var grouped: [ModelForView] = []
               for friend in modelParse {
                   if let char = (friend.userName.components(separatedBy: " ")[0].first) {
                       let str = String(char)
                       if let index = grouped.firstIndex(where: {$0.header == str}) {
                           grouped[index].rows.append(friend)
                       } else {
                           grouped.append(ModelForView(header: str, rows: [friend]))
                       }
                   }
               }
            //   if grouped.count != self.groupedFiends.count {
                   // Если подгрузились новые друзья то обновляем View
                   return  grouped.sorted(by: {$0.header < $1.header})
              //     DispatchQueue.main.async {
                      // self.groupedFiends = sorted
               //    }
              // }
    }
}
