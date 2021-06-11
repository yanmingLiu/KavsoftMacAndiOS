//
//  Home.swift
//  Kavsoft_MacOS_iOS
//
//  Created by lym on 2021/6/10.
//

import SwiftUI

struct Home: View {
    @State var currentTab = "Home"
    @State var showMenu: Bool = false
    
    var body: some View {
        HStack {
            AdaptableStack(showMenu: $showMenu) {
                MainContent(showMenu: $showMenu)
            } menuView: {
                SideMenu(currentTab: $currentTab)
            } sideView: {
                SideView()
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Adaptable For Both iOS & macOS - Complex UI - SwiftUI Tutorials
struct AdaptableStack<Content: View, MenuView: View, SideView: View>: View {
    var content: Content
    var menuView: MenuView
    var sideView: SideView
    
    // For Slide Menu iOS
    @Binding var showMenu: Bool
    
    init(showMenu: Binding<Bool>,
         @ViewBuilder content: @escaping () -> Content,
         @ViewBuilder menuView: @escaping () -> MenuView,
         @ViewBuilder sideView: @escaping () -> SideView) {
        _showMenu = showMenu
        self.content = content()
        self.menuView = menuView()
        self.sideView = sideView()
    }
    
    var body: some View {
        ZStack {
            #if os(iOS)
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack {
                    content
                    
                    sideView
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
            })
            .background(Color.gray.brightness(0.4).ignoresSafeArea())
            .overlay(
                menuView
                    .clipped()
                    .frame(width: getRect().width / 1.6) // Max Width
                    .background(Color.gray.brightness(0.40).ignoresSafeArea())
                    .offset(x: showMenu ? 0 : -getRect().width)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        Color.black
                            .opacity(showMenu ? 0.35 : 0)
                            .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation {
                                    showMenu.toggle()
                                }
                            }
                    )
            )
            
            #else
            
            HStack {
                menuView
                    .frame(width: 210) // Max Width
                    .background(Color.gray.brightness(0.40).ignoresSafeArea())
                
                content
                
                sideView
            }
            .frame(width: getRect().width / 1.3, height: getRect().height - 100, alignment: .leading)
            .background(Color.white.ignoresSafeArea())
            // Applying button style to whole view
            .buttonStyle(PlainButtonStyle())
            #endif
        }
        .preferredColorScheme(.light)
    }
}
