//
//  UserListViewModel.swift
//  SwiftUISample
//
//  Created by Shakti Prakash Srichandan on 01/07/23.
//

import Foundation

class UserListViewModel: ObservableObject {
    @Published  var users: [User]?
    
    @MainActor
    func getUserList() async -> Void  {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else  { return  }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode([User].self, from: data)
            self.users = decodedData
        } catch {
            debugPrint("error")
        }
    }
}
