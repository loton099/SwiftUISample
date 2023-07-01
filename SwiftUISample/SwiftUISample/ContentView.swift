//
//  ContentView.swift
//  SwiftUISample
//
//  Created by Shakti Prakash Srichandan on 30/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = UserListViewModel()
    var body: some View {
        NavigationView {
            VStack {
                if let users = viewModel.users {
                    List(users) { user in
                        VStack(alignment: .leading) {
                            /*@START_MENU_TOKEN@*/Text(user.name)/*@END_MENU_TOKEN@*/
                            Text(user.username)
                            Text(user.email)
                        }
                    }
                    
                } else {
                    ProgressView()
                }
            }
            .task {
                await viewModel.getUserList()
            }
            .navigationTitle("User List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
