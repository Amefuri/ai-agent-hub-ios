
import SwiftUI

final class AppDIContainer {
    func makeHomeView() -> some View {
        HomeDIContainer().makeHomeView()
    }
}
