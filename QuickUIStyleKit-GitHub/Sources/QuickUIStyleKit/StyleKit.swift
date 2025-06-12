import SwiftUI

/// Modifier for applying a neon-style gradient background across the full screen.
public struct NeonGradientBackground: ViewModifier {
    public init() {}

    public func body(content: Content) -> some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.07, green: 0.05, blue: 0.2),
                    Color(red: 0.18, green: 0.0, blue: 0.38),
                    Color(red: 0.25, green: 0.0, blue: 0.55)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            content
        }
    }
}

/// Modifier for adding a glowing shadow around any view.
public struct Glow: ViewModifier {
    let color: Color
    let radius: CGFloat

    public init(color: Color = .purple, radius: CGFloat = 10) {
        self.color = color
        self.radius = radius
    }

    public func body(content: Content) -> some View {
        content
            .shadow(color: color.opacity(0.6), radius: radius)
    }
}

/// Modifier for styling views as frosted, neon-style cards.
public struct NeonCard: ViewModifier {
    let cornerRadius: CGFloat

    public init(cornerRadius: CGFloat = 16) {
        self.cornerRadius = cornerRadius
    }

    public func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.white.opacity(0.1), lineWidth: 1)
            )
            .modifier(Glow(color: .blue, radius: 4))
    }
}

/// Extension to apply the modifiers conveniently to any View.
public extension View {

    /// Applies the full-screen neon gradient background.
    func neonBackground() -> some View {
        self.modifier(NeonGradientBackground())
    }

    /// Applies a glowing shadow effect.
    func glow(color: Color = .purple, radius: CGFloat = 10) -> some View {
        self.modifier(Glow(color: color, radius: radius))
    }

    /// Styles the view as a neon card.
    func neonCard(cornerRadius: CGFloat = 16) -> some View {
        self.modifier(NeonCard(cornerRadius: cornerRadius))
    }
}


/// A reusable ButtonStyle that gives any button a neon glassy look with glow.
public struct NeonButtonStyle: ButtonStyle {
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 24)
            .padding(.vertical, 14)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.purple.opacity(0.2))
                    .background(.ultraThinMaterial)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.purple.opacity(configuration.isPressed ? 0.4 : 0.8), lineWidth: 1.5)
                    )
                    .shadow(color: Color.purple.opacity(configuration.isPressed ? 0.4 : 0.8), radius: 10)
            )
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
