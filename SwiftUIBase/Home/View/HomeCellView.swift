//
//  HomeCellView.swift
//  SwiftUIBase
//
//  Created by Karuppasamy Palanikumar on 31/10/22.
//

import SwiftUI

struct HomeCellView: View {
    var userDetail: VidRivalUser
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "heart.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.red)
                    .frame(width: 50,
                           height: 50)
                    .padding(.all,8)
                VStack(alignment: .leading) {
                    Text(userDetail.fullname)
                        .font(.title)
                        .foregroundColor(.brown)
                        .padding(.bottom,5)
                    Text(userDetail.displayID)
                        .font(.subheadline)
                        .padding(.bottom,5)
                }
                Spacer()
                Button {
                    
                } label: {
                    Text("Add")
                        .padding(.all)
                }

            }
        }
    }
}

struct HomeCellView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCellView(userDetail: VidRivalUser())
    }
}
