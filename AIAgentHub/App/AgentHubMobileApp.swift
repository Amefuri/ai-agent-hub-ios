
import SwiftUI

@main
struct AgentHubMobileApp: App {
    let container = AppDIContainer()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                container.makeHomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                Text("Tab 2")
                    .tabItem {
                        Label("Tab 2", systemImage: "star")
                    }
                Text("Tab 3")
                    .tabItem {
                        Label("Tab 3", systemImage: "heart")
                    }
                Text("Tab 4")
                    .tabItem {
                        Label("Tab 4", systemImage: "gear")
                    }
                Text("Tab 5")
                    .tabItem {
                        Label("Tab 5", systemImage: "person")
                    }
            }
        }
    }
}
