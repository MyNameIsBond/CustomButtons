import SwiftUI

struct ContentView: View {
    var body: some View {
        RadiantButton(startColor: Color.yellow, endColor: Color.red)
    }
}


struct RadiantButton: View {
    
    var startColor: Color
    var endColor: Color
    
    var body: some View {
        Button(action: {}) {
            HStack {
                Image(systemName: "heart").foregroundColor(Color.primary)
                Text("Like The Post").foregroundColor(Color.primary)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

struct ButtonStyle: View {
    var body: some View {
        VStack {
            Button("Plain", action: {
            }).buttonStyle(PlainButtonStyle())

            Button("Borderless", action: {
            }).buttonStyle(BorderlessButtonStyle())

            Button("Default", action: {
            }).buttonStyle(DefaultButtonStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
