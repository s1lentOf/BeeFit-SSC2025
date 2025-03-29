import SwiftUI

struct RegisterPage1View: View {
    @EnvironmentObject var fontManager: FontManager
    @Binding var userName: String
    
    @FocusState private var isNameFieldFocused: Bool

    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("Who are you?")
                    .font(fontManager.font1)
                    .padding(.vertical, 5)
                
                Text("We’d love to get to know you better! Tell us a little about yourself")
                    .font(fontManager.font2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }
            
            Spacer()
            
            HStack {
                TextField("Your name", text: $userName)
                    .focused($isNameFieldFocused)
                    .padding(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.primary, lineWidth: 1)
                    )
            }
            .padding(.horizontal, 10)
            
            Spacer()
            Spacer()
            Spacer()
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .padding(20)
        .onTapGesture {
            isNameFieldFocused = false
        }
    }
}

#Preview {
    RegisterView()
}
