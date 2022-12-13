//
//  FriendsViewModel.swift
//  
//
//  Created by Ivan Konishchev on 13.12.2022.
//

import Foundation
import SwiftUI
import LoadService
import FriendsModel

@available(iOS 13.0, *)
public final class FriendsViewModel: ObservableObject {
    let service: LoadService
    
    @Published var data: [ModelForView] = []
    
    public func loadData() async {
        
        await service.loadFromInternet(object: FriendsModel.self) { object in
            
            Parser().parseResponse(from: object.response) { data in
            
              DispatchQueue.main.async {
                  self.data = data
              }
          }
        }
        
    }
    
   public init(token: String, userId: String){
       self.service = LoadService(userId: userId, method: .getCountFriends(token: token, userId: userId))
    }
}
