//
//  AddText.swift
//  timecapsule
//
//  Created by James Lee on 2020-11-21.
//

import SwiftUI

struct AddText: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var fullText: String = ""
    @Binding var textSave:Bool
    init(textSave: Binding<Bool>) {
        UITextView.appearance().backgroundColor = .clear
        self._textSave = textSave
    }
    var body: some View {
        ZStack{
        Color(red: 18/255, green: 33/255, blue: 60/255)
                        .ignoresSafeArea()
            VStack(alignment: .leading){
                HStack{
                    Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                        Text("Cancel")
                    }
                    Spacer()
                    Text("Add Text").foregroundColor(.white).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                        self.textSave = true
                    }) {
                        Text("Done").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                }.padding()
                ZStack(alignment: .leading){
                    if fullText.isEmpty{
                        VStack{
                            Text("What do you want to write?").padding().foregroundColor(.white).opacity(0.5).padding([.top], 10).padding(.leading,5)
                            Spacer()
                        }
                    }
                    TextEditor(text: $fullText).foregroundColor(.white).padding()
                }
            }
        }.navigationBarTitle("").navigationBarHidden(true)
    }
}

struct AddText_Previews: PreviewProvider {
    @State static var value = false
    static var previews: some View {
        AddText(textSave: $value)
    }
}
