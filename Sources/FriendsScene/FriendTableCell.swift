//
//  File.swift
//  
//
//  Created by Ivan Konishchev on 13.12.2022.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
struct FriendTableCell: View {
    let rowHeight: CGFloat
    let color: Color
    let friend: ModelForParse
    
    init(friend: ModelForParse, rowHeight: CGFloat, cellBackGround: Color = .gray)  {
        self.friend = friend
        self.rowHeight = rowHeight
        self.color = cellBackGround
    }
    
    var body: some View {
        
        HStack(spacing: 0) {

//            ImageAvatar1 {
//                AsyncLoadAvatar(url: friend.photo,size: 50)
//                
//            }
//            .padding(.leading, 10)

            VStack(alignment: .leading,spacing: 0) {
                    Text(friend.userName)
                HStack(spacing: 0) {
                    Text(friend.city)
                        .font(.subheadline)
                        .fontWeight(.ultraLight)
                    Spacer()
                    if friend.isBanned {
                        Text("Banned")
                            .fontWeight(.heavy)
                            .font(.footnote)
                            .foregroundColor(.pink)
                    } else if friend.isClosedProfile {
                        Text("Private")
                            .fontWeight(.heavy)
                            .font(.footnote)
                            .foregroundColor(.red)
                    }
                    
                }
            }
                .padding(.leading, 15)
            
            Spacer()
        }


        .frame(height: rowHeight)
        .background(Color.gray.opacity(0.2))

    }
    
}
