//
//  LoginSignupView.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/21/21.
//

import SwiftUI


struct LoginSignupView: View {
  let viewModel: LoginSignupViewModel
  
  @State private var userName = ""
  @State private var email = ""
  @State private var password = ""
  @State private var authState: AuthState = .signUp
  
  private let formTextFieldWidth = CGFloat(200)
  
  
  let columns = [
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible()),
  ]
  
  var body: some View {
    VStack(spacing: 20.0) {
      
      LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
        
        if authState == .login {
          Text("Username")
          TextField("Username", text: $userName)
            .frame(width: formTextFieldWidth)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .textContentType(.username)
            .autocapitalization(.none)
            .disableAutocorrection(true)
          
          Spacer()
          
          Text("Password")
          SecureField("Password", text: $password)
            .frame(width: formTextFieldWidth)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .textContentType(.password)
            .autocapitalization(.none)
        } else {
          Text("Username")
          TextField("Username", text: $userName)
            .frame(width: formTextFieldWidth)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .textContentType(.username)
            .autocapitalization(.none)
            .disableAutocorrection(true)
          
          Spacer()
          
          Text("Email")
          TextField("Email", text: $email)
            .frame(width: formTextFieldWidth)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .textContentType(.emailAddress)
            .autocapitalization(.none)
            .disableAutocorrection(true)
          
          Spacer()
          
          Text("Password")
          SecureField("Password", text: $password)
            .frame(width: formTextFieldWidth)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .textContentType(.password)
            .autocapitalization(.none)
        }
      }
      .padding([.leading, .trailing], 40)
      
      VStack(spacing: 10) {
        Button("Submit") {
          if authState == .login {
            viewModel.login(username: userName, password: password)
          } else {
            viewModel.signup()
          }
        }
        .frame(width: 300, height: 64, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .foregroundColor(.white)
        .background(Color.green.opacity(0.6))
        .clipShape(Capsule(style: .circular))
      }
      
      Picker("", selection: $authState) {
        ForEach(AuthState.allCases, id: \.rawValue) { value in
          Text(value.localizedName)
            .tag(value)
        }
      }.pickerStyle(SegmentedPickerStyle())
      .padding([.leading, .trailing], 40)
      
    }.navigationTitle("SwiftGram")
  }
}

struct LoginSignupView_Previews: PreviewProvider {
  static var previews: some View {
    LoginSignupView(viewModel: LoginSignupViewModel(client: MockAuthClient()))
  }
}
