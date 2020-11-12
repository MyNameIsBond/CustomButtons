import SwiftUI

/*
 lightShadow : rgb(255,255,255)
 DarkShadow: rgb(163,177,198)
 Background: rgb(224,229,236)
 accent color: rgb(163,177,198)
 */


struct ContentView: View {
    var body: some View {
        ZStack {
            Color.background
            Button(action: {
                print("Delete tapped!")
            }) {
                HStack {
                    Image(systemName: "trash")
                        .foregroundColor(Color.white)
                    Text("Delete")
                        .foregroundColor(Color.white)
                }
            }.buttonStyle(RoundedCorners(color: Color.orange))
        }.ignoresSafeArea()
        
    }
}




extension Color {
    static let lightShadow = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
    static let darkShadow = Color(red: 163 / 255, green: 177 / 255, blue: 198 / 255)
    static let background = Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
    
}

extension Color {

    static let voffWhite = Color(red: 225 / 255, green: 225 / 255, blue: 225 / 255)
}


struct neumorphic: ButtonStyle {
 
    var color: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            
            .padding(.horizontal,20)
            .padding(10)
            .background(Color.background)
            .cornerRadius(5)
            .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
            .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
                       
    }
}

struct OutlineButton: ButtonStyle {
 
    var color: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 20)
            .padding(10)
            .border(color, width: 1)
            .foregroundColor(.white)
            .padding(2)
            .shadow(radius: 10)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
        
    }
}



struct OutlineBoarder: ButtonStyle {
 
    var color: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 20)
            .padding(10)
            .background(configuration.isPressed ? color.opacity(0.5) : color)
            .foregroundColor(.white)
            .padding(2)
            .border(color, width: 1)
            .shadow(radius: 10)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct RoundedCorners: ButtonStyle {
 
    var color: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal,50)
            .padding(10)
            .cornerRadius(20)
            .overlay(
                   RoundedRectangle(cornerRadius: 10)
                       .stroke(color, lineWidth: 1)
               )
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
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .leading, endPoint: .trailing).opacity(configuration.isPressed ? 0.5 : 1))
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .shadow(radius: 10)
    }
}



struct DefaultButtons: View {
    var body: some View {
        VStack(spacing: 10) {
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
