//
//  RepositoryView.swift
//  RepoInfo
//
//  Created by Neli Todorova on 14.07.22.
//

import SwiftUI

struct RepositoryView: View {
    @StateObject private var viewModel = RepositoryViewModel()
    
    var repository: Repository
    
    var body: some View {
            HStack {
                Image(viewModel.setImage(repositoryLanguage: repository.language ?? "default"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 60)
                VStack(alignment: .leading) {
                    Text(repository.name)
                    Text("Last push on: " + viewModel.formatStringDate(date: repository.updated_at) )
                }
                Spacer()
            }
        }
}
