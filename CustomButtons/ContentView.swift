import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Button(action: {
            print("Delete tapped!")
        }) {
            HStack {
                Image(systemName: "trash")
                    .font(.title)
                Text("Delete")
                    .fontWeight(.semibold)
                    .font(.title)
            }
        }
        .buttonStyle(GradientBackgroundStyle())
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


struct GradientBackgroundStyle: PrimitiveButtonStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .padding(.horizontal, 20)
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
