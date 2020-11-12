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
        .buttonStyle(GradientBackgroundStyle(startColor: Color.purple, endColor: Color.orange))
    }
}


struct GradientBackgroundStyle: ButtonStyle {
 
    var startColor: Color
    var endColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .shadow(radius: 10)
    }
}



struct DefaultButtons: View {
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
