/*
 View for FriendsScene
 
 
 */
import Foundation
import SwiftUI
//import FriendsViewModel

@available(iOS 16.0, *)
public struct FriendsScene: View {
    
    @ObservedObject var viewModel: FriendsViewModel // ViewModel
    @Binding var isSelected: Bool //  выбранный друг
    
    var rowHeight: CGFloat = 60 // Высота ячейки
    
 //MARK: - body
    public var body: some View {
        ZStack {
            NavigationStack(root: {
                List {
                    ForEach(viewModel.data, id: \.self) { item in
                        Section(header:
                                    Text(item.header)
                        ){
                            ForEach(item.rows, id: \.self) { friend in
                                NavigationLink(destination:
                                                EmptyView()
                                ) {
                                    FriendTableCell(friend: friend, rowHeight: rowHeight)
                                }
                                .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 2, trailing: 0))
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.clear)
                            }
                        }
                        
                    }
                    
                }
                .navigationTitle("Друзья")
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(GroupedListStyle())
            })
        }
        .task {
            await self.viewModel.loadData()
        }
    }
    
 //MARK: - Init
    public init(isSelected: Binding<Bool>, token: String, userId: String) {
        self._isSelected = isSelected
        self.viewModel = FriendsViewModel(token: token, userId: userId)
        
    }
    
}
