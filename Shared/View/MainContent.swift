//
//  MainContent.swift
//  Kavsoft_MacOS_iOS
//
//  Created by lym on 2021/6/10.
//

import SwiftUI

struct MainContent: View {
    @State var search: String = ""
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack {
            HStack {
                if !isMacOS() {
                    Button(action: {
                        withAnimation {
                            showMenu.toggle()
                        }
                    }, label: {
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .foregroundColor(.black)
                    })
                }
                
                Text("Dashboard")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
                
                // Custom Search Bar...
                if isMacOS() {
                    CustomSearchBar(search: $search)
                        .frame(maxWidth: 300)
                }
            }
            .padding(isMacOS() ? 15 : 0)
            
            if !isMacOS() {
                CustomSearchBar(search: $search)
                    .padding(.bottom)
            }
            
            ZStack {
                if isMacOS() {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        BodyContent()
                    })
                } else {
                    BodyContent()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray.brightness(0.40))
            .cornerRadius(isMacOS() ? 10 : 0)
            .padding(isMacOS() ? 10 : 0)
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct MainContent_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BodyContent: View {
    var body: some View {
        VStack {
            VStack {
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 10) {
                        StorageView(image: "Dropbox_Icon", title: "Dropbox", percentage: 0.6)
                        StorageView(image: "Google_Drive_icon", title: "Google Diver", percentage: 0.7)
                        StorageView(image: "iCloud_icon", title: "iCloud", percentage: 0.8)
                    }
                })
                
                Text("Quick Access")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                
                // Quick Access Buttons
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack {
                        AccessButton(image: "photo", title: "Pictures", color: Color.yellow)
                        AccessButton(image: "music.note.house.fill", title: "Music", color: Color.blue)
                        AccessButton(image: "square.grid.2x2.fill", title: "Apps", color: Color.orange)
                        AccessButton(image: "play.rectangle.fill", title: "Videos", color: Color.red)
                        AccessButton(image: "doc.fill", title: "Documents", color: Color.blue)
                        AccessButton(image: "arrow.down.app.fill", title: "Downloads", color: Color.purple)
                    }
                    .padding(.top)
                })
                
                Text("Recent Files")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack {
                        VStack {
                            HStack {
                                Text("Name")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                
                                Spacer()
                                
                                Text("Size")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            
                            Divider()
                            
                            // Files
                            VStack(spacing: 12) {
                                FilesView(fileName: "Pictures.png", fileSize: "6 GB", fileImage: "photo")
                                FilesView(fileName: "Music.png", fileSize: "6 GB", fileImage: "music.note.house.fill")
                                FilesView(fileName: "Apps.png", fileSize: "6 GB", fileImage: "square.grid.2x2.fill")
                                FilesView(fileName: "Videos.png", fileSize: "6 GB", fileImage: "play.rectangle.fill")
                                FilesView(fileName: "Documents.png", fileSize: "6 GB", fileImage: "doc.fill")
                                FilesView(fileName: "Downloads.png", fileSize: "6 GB", fileImage: "arrow.down.app.fill")
                            }
                        }
                        .frame(width: 250)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 5, y: 5)
                    }
                    .padding(.top)
                })
            }
        }
        .padding(isMacOS() ? 15 : 0)
    }
}

struct CustomSearchBar: View {
    @Binding var search: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $search)
                .textFieldStyle(PlainTextFieldStyle())
            
            Button(action: {}, label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.blue)
                    .cornerRadius(4.0)
            })
        }
        .padding(.leading)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .gray.opacity(0.2), radius: 2, x: 2, y: 2)
        .shadow(color: .gray.opacity(0.2), radius: 2, x: -2, y: 2)
    }
}

struct StorageView: View {
    var image: String
    var title: String
    var percentage: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            HStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 45, height: 45)
                    .background(Color.white)
                
                Divider()
                    .frame(height: 45)
                    .padding(.horizontal)
                
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.4), lineWidth: 8.0)
                    
                    Circle()
                        .trim(from: 0.0, to: percentage)
                        .stroke(Color.blue, style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: .round))
                        .rotationEffect(.init(degrees: -90))
                    
                    Text("\(Int(percentage * 100))%")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .frame(width: 50, height: 50)
            }
            
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)
            
            Text("140 GB/ 150 GB")
                .font(.caption)
                .foregroundColor(.gray)
            
        })
        .padding()
        .background(Color.white)
        .cornerRadius(8.0)
    }
}

struct AccessButton: View {
    var image: String
    var title: String
    var color: Color
    
    var body: some View {
        Button(action: {}, label: {
            VStack(spacing: 12) {
                Image(systemName: image)
                    .font(.title)
                    .foregroundColor(color)
                    .frame(width: 50, height: 50)
                    .background(Color.white)
                    .cornerRadius(8.0)
                    .shadow(color: .black.opacity(0.2), radius: 2, x: 2, y: 2)
                
                Text(title)
                    .font(.caption)
                    .fontWeight(.bold)
                    .kerning(1.3)
                    .foregroundColor(.black)
            }
        })
        .frame(width: isMacOS() ? 80 : 100)
    }
}

struct FilesView: View {
    var fileName: String
    var fileSize: String
    var fileImage: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: fileImage)
                .foregroundColor(.yellow)
                .padding(6)
                .background(RoundedRectangle(cornerRadius: 4).stroke(Color.gray.opacity(0.3)))
            
            VStack(alignment: .leading, spacing: 4, content: {
                Text(fileName)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text("20 March 1999")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            })
            
            Spacer(minLength: 10)
            
            Text(fileSize)
                .font(.caption)
                .fontWeight(.bold)
        }
    }
}
