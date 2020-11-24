//
//  AddView.swift
//  timecapsule
//
//  Created by James Lee on 2020-11-21.
//

import SwiftUI

struct AddView: View {
    //photo library
    @State private var displayPhotoLibrary = false
    @State private var inputImage: UIImage?
    @State var image: Image?

    @State var displayTextInputSheet = false
    @State var navigateToMyCapsules: Bool = false
    @State var textSave:Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                Image("space-background").resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Build a New Capsule").foregroundColor(.white).font(.system(size: 35)).fontWeight(.bold).padding()
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action: {self.displayTextInputSheet.toggle()}){
                            VStack(spacing: 10){
                                Image(systemName: "doc.plaintext").font(.system(size: 35)).foregroundColor(.white)
                                Text("Text").foregroundColor(.white).fontWeight(.bold)
                            }
                        }.sheet(isPresented: $displayTextInputSheet,
                                onDismiss: {
                                    if(self.textSave){
                                        self.navigateToMyCapsules.toggle()
                                        self.textSave = false
                                    }
                                }){
                            AddText(textSave: $textSave)
                        }
                        Spacer()
                        Button(action:{self.displayPhotoLibrary = true}){
                            VStack(spacing: 10){
                                Image(systemName: "photo.on.rectangle").font(.system(size: 35)).foregroundColor(.white)
                            Text("Image").foregroundColor(.white).fontWeight(.bold)
                            }
                        }
                        Spacer()
                        VStack(spacing: 10){
                            Image(systemName: "video.badge.plus.fill").font(.system(size: 35)).foregroundColor(.white)
                            Text("Video").foregroundColor(.white).fontWeight(.bold)
                        }
                        Spacer()
                    }
                    //Spacer()
                    Spacer()
                    HStack(){
                        NavigationLink(
                            destination: CapsuleListView(), isActive: $navigateToMyCapsules){
                                Text("My Capsules").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .padding().background(Color(red: 18/255, green: 33/255, blue: 60/255, opacity: 0.9)).foregroundColor(.white).cornerRadius(25)
                            }.buttonStyle(PlainButtonStyle())
                    }
                    Spacer()
                }
            }
        }.sheet(isPresented: $displayPhotoLibrary, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
