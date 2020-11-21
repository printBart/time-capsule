//
//  AddView.swift
//  timecapsule
//
//  Created by James Lee on 2020-11-21.
//

import SwiftUI

struct AddView: View {
    init() {
        UINavigationBar.appearance().isUserInteractionEnabled = false
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = .clear
    }

    var body: some View {
        NavigationView{
            ZStack{
                Image("space-background").resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Build a New Capsule").foregroundColor(.white).font(.system(size: 35)).padding()
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink(
                            destination: AddText(),
                            label: {
                                VStack(spacing: 10){
                                    Image(systemName: "doc.plaintext").font(.system(size: 35)).foregroundColor(.white)
                                    Text("Text").foregroundColor(.white).fontWeight(.bold)
                                }
                            })
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
                    Spacer()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
