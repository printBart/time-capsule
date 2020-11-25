//
//  RegisterPasswordView.swift
//  timecapsule
//
//  Created by James Lee on 2020-11-24.
//

import SwiftUI

struct Response: Decodable {
    var value: Bool
}

struct RegisterPasswordView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var globalData: GlobalData
    @Binding var registerData: RegisterData
    @State private var password = ""
    @State private var confirmpassword = ""
    var body: some View {
        ZStack{
            Image("space-clean-background").resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all).frame(maxWidth: UIScreen.main.bounds.width)
            VStack{
                HStack{
                    Button(action: {self.presentationMode.wrappedValue.dismiss()}){
                    Image(systemName: "chevron.left").font(Font.system(size: 20, weight: .semibold))
                    }
                    Spacer()
                }.foregroundColor(.blue)
                Text("Create a Password").tracking(2).foregroundColor(.white).padding().font(.system(size: 30))
                ZStack(alignment: .leading){
                    if(password.isEmpty){
                        Text("Password").foregroundColor(.gray).padding(10)
                    }
                    TextField("", text: $password).foregroundColor(.white)
                    .frame(height: 50).padding([.leading, .trailing], 10)
                    .background(Color(red: 19/255, green: 46/255, blue: 75/255, opacity: 0.5)).cornerRadius(5).autocapitalization(.none)
                }
                ZStack(alignment: .leading){
                    if(confirmpassword.isEmpty){
                        Text("Confirm Password").foregroundColor(.gray).padding(10)
                    }
                    TextField("", text: $confirmpassword).foregroundColor(.white)
                    .frame(height: 50).padding([.leading, .trailing], 10)
                    .background(Color(red: 19/255, green: 46/255, blue: 75/255, opacity: 0.5)).cornerRadius(5).autocapitalization(.none)
                }
                Spacer()
                Button(action: {register()}){
                    Text("Register").bold().padding(10).frame(width: UIScreen.main.bounds.width-40).background(Color(UIColor.systemBlue)).foregroundColor(.white).cornerRadius(5)
                }
            }.padding()
        }.navigationBarTitle("").navigationBarHidden(true)
    }
    func register(){
        if(password == confirmpassword){
            registerData.password = password
            guard let encoded = try? JSONEncoder().encode(registerData) else{
                print("Failed to encode register data")
                return
            }
            let url = URL(string: "http://192.168.1.2:3001/api/register")!
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = encoded
            URLSession.shared.dataTask(with: request){data, response, error in
                guard let data = data else{
                    print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                        return
                }
                if let decodedOrder = try? JSONDecoder().decode(Response.self, from:data){
                    DispatchQueue.main.async {
                        if(decodedOrder.value){
                            globalData.userId = registerData.userId.uuidString
                            globalData.isAuthenticated = true
                        }
                    }
                } else{
                    print("Invalid response from server")
                }
            }.resume()
        }
    }
}

/*struct RegisterPasswordView_Previews: PreviewProvider {
    @State var registerData = RegisterData()
    static var previews: some View {
        RegisterPasswordView(registerData: registerData)
    }
}*/
