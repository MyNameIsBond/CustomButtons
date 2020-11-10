import SwiftUI

struct ContentView: View {
    var body: some View {
        RadiantButton(text: "Like The Post", image: "heart",startColor: Color.yellow, endColor: Color.red)
    }
}


struct RadiantButton: View {
    
    var text: String
    var image: String
    var startColor: Color
    var endColor: Color
    
    var body: some View {
        Button(action: {}) {
            HStack {
                Image(systemName: image).foregroundColor(Color.primary)
                Text(text).foregroundColor(Color.primary)
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
