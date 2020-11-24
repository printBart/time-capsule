//
//  AddTypeSheetView.swift
//  timecapsule
//
//  Created by James Lee on 2020-11-22.
//

import SwiftUI

struct AddTypeSheetView: View {
    var body: some View {
        ZStack{
            Color(red: 24/255, green: 44/255, blue: 80/255)
                            .ignoresSafeArea()
            VStack{
                Rectangle()
                    .fill(Color(red: 36/255, green: 65/255, blue: 119/255)).frame(width: UIScreen.main.bounds.width/3, height: 5).cornerRadius(25).padding()
                Spacer()
                HStack{
                    Spacer()
                    VStack(spacing: 10){
                        Image(systemName: "doc.plaintext").font(.system(size: 35)).foregroundColor(.white)
                        Text("Text").foregroundColor(.white).fontWeight(.bold)
                    }
                    Spacer()
                    VStack(spacing: 10){
                        Image(systemName: "photo.on.rectangle").font(.system(size: 35)).foregroundColor(.white)
                    Text("Image").foregroundColor(.white).fontWeight(.bold)
                    }
                    Spacer()
                    VStack(spacing: 10){
                        Image(systemName: "video.badge.plus.fill").font(.system(size: 35)).foregroundColor(.white)
                        Text("Video").foregroundColor(.white).fontWeight(.bold)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct AddTypeSheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddTypeSheetView()
    }
}
