//
//  SideView.swift
//  Kavsoft_MacOS_iOS
//
//  Created by lym on 2021/6/11.
//

import SwiftUI

struct SideView: View {
    var body: some View {
        VStack {
            Text("Storage")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            // Storage Space...
            VStack {
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.3), lineWidth: 25)
                    
                    Circle()
                        .trim(from: 0, to: 0.7)
                        .stroke(Color.blue, style: StrokeStyle(lineWidth: 25, lineCap: .round, lineJoin: .round))
                        .rotationEffect(.init(degrees: -90))
                    
                    VStack {
                        Text("70%")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text("Used")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                }
                .frame(width: 130, height: 170)
                
                HStack {
                    VStack(alignment: .leading, spacing: 6, content: {
                        Text("Total Space")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        
                        Text("256 GB")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    })
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: 6, content: {
                        Text("Used Space")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        
                        Text("128 GB")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    })
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 25)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: .black.opacity(0.05), radius: 5, x: 5, y: 5)
        }
        .frame(width: 220)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Color.gray.brightness(0.40))
    }
}

struct SideView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
