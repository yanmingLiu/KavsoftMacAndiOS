//
//  SideMenu.swift
//  Kavsoft_MacOS_iOS
//
//  Created by lym on 2021/6/10.
//

import SwiftUI

struct SideMenu: View {
    @Binding var currentTab: String
    @Namespace var animation
    
    var body: some View {
        VStack {
            HStack {
                Text("Files")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .kerning(1.5)
                
                Text("GO")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .kerning(1.5)
                    .padding(8)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(10)
            
            Divider()
                .background(Color.gray.opacity(0.4))
                .padding(.bottom)
            
            HStack(spacing: 12) {
                Image("img_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .background(Color.gray.opacity(0.5))
                    .clipShape(Circle())
                    .overlay(
                        // border radius 2 种实现
                        //                        RoundedRectangle(cornerRadius: 25)
                        //                            .stroke(Color.white, lineWidth: 2)
                        Capsule(style: .circular)
                            .stroke(Color.white, lineWidth: 2)
                    )
                
                Text("Hello SwiftUI")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            VStack(spacing: 15) {
                TabButton(image: "house.fill", title: "Home", animation: animation, currentTab: $currentTab)
                TabButton(image: "folder.fill.badge.person.crop", title: "Shared Files", animation: animation, currentTab: $currentTab)
                TabButton(image: "waveform.path.ecg.rectangle.fill", title: "Statistics", animation: animation, currentTab: $currentTab)
                TabButton(image: "cart.fill.badge.plus", title: "Shop Card", animation: animation, currentTab: $currentTab)
                TabButton(image: "gearshape.fill", title: "Settings", animation: animation, currentTab: $currentTab)
                TabButton(image: "rectangle.righthalf.inset.fill.arrow.right", title: "Log Out", animation: animation, currentTab: .constant(""))
            }
            .padding(.leading, 20)
            .offset(x: 15)
            .padding(.top, 20)
        }
        .frame(maxHeight: .infinity, alignment: .top) // To Avoid Space..
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabButton: View {
    var image: String
    var title: String
    var animation: Namespace.ID
    @Binding var currentTab: String
    
    var body: some View {
        Button(action: {
            withAnimation {
                currentTab = title
            }
        }, label: {
            HStack(spacing: 15, content: {
                Image(systemName: image)
                    .font(.title2)
                    .foregroundColor(currentTab == title ? Color.blue : Color.gray.opacity(0.8))
                
                Text(title)
                    .fontWeight(.bold)
                    .foregroundColor(currentTab == title ? Color.blue : Color.black.opacity(0.8))
                    .kerning(1.2)
            })
            .padding(.vertical, 12)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                ZStack {
                    if currentTab == title {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    } else {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.clear)
                    }
                }
            )
            .contentShape(Rectangle()) // For mouse clicking on padded areas
        })
    }
}
