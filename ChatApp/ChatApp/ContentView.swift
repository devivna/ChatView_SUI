//
//  ContentView.swift
//  ChatApp
//
//  Created by Надія on 07.12.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct Home: View {
    
    @State var index = 0
    @State var expand = false
    
    var body: some View {
        
        ZStack {
            VStack {
                Color.white
                Color("Menu")
            }
            
            VStack(spacing: 0) {
                
                ZStack {
                    Chats(expand: self.$expand).opacity(self.index == 0 ? 1: 0)
                    Groups().opacity(self.index == 1 ? 1: 0)
                    Settings().opacity(self.index == 2 ? 1: 0)
                }
                
                BottomView(index: self.$index)
                                
            }
            
        }
        .edgesIgnoringSafeArea(.all)

    }
}

struct Chats: View {
    @Binding var expand: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            TopView(expand: self.$expand).zIndex(25)
            CenterView(expand: self.$expand).offset(y:-25)
        }
    }
    
}

struct Groups: View {
    var body: some View {
        GeometryReader { _ in
            VStack {
                Text("Group")
            }
            
        }
        .padding(.top)
        .background(.white)
        .clipShape(shape())
        .padding(.bottom, 25)
    }
}

struct Settings: View {
    var body: some View {
        GeometryReader { _ in
            VStack {
                Text("Settings")
            }
            
        }
        .padding(.top)
        .background(.white)
        .clipShape(shape())
        .padding(.bottom, 25)

    }
}

struct TopView: View {
    @State var search = ""
    @Binding var expand: Bool
    
    var body: some View {
        VStack(spacing: 18) {
            
            if self.expand{
                HStack {
                    Text("Messages")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary.opacity(0.7))
                    
                    Spacer()
                    
                    Button {
                        //
                    } label: {
                        Image(systemName: "command")
                            
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 18) {
                        Button {
                            //
                        } label: {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.primary)
                                .padding(25)
                        }
                        .background(.teal.opacity(0.6))
                        .clipShape(Circle())
                        
                        ForEach(1...10, id: \.self) { num in
                            Button {
                                //
                            } label: {
                                Image("p\(num)")
                                    .resizable()
                                    .frame(width: 65, height: 60)
                                    .clipShape(Circle())
                            }
                        }
                    }
                }
            }
            
            
            HStack(spacing: 15) {
                Image(systemName: "plus.magnifyingglass")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(.primary.opacity(0.3))
                
                TextField("Find a friend", text: self.$search)
            }
            .padding()
            .background(.white)
            .cornerRadius(8)
            .padding(.bottom, 10)
            
        }
        .padding()
        .padding(.top)
        .background(Color.init(uiColor: .secondarySystemBackground))
        .clipShape(shape())
        .animation(.default, value: 1) // ? value
    
         
    }
    
}

struct CenterView: View {
    
    @Binding var expand : Bool
    
    var body: some View {
        List(data) { index in
            if index.id == 0 {
                cellView(data: index)
                    .onAppear {
                        self.expand = true
                    }
                    .onDisappear {
                        self.expand = false
                    }
            } else {
                cellView(data: index)
            }
            
        }
        .padding(.top, 20)
        .background(.white)
        .clipShape(shape())
    }
}

struct BottomView: View {
    
    @Binding var index: Int
    
    var body: some View {
        HStack {
            Button {
                self.index = 0
            } label: {
                Image(systemName: "message.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(self.index == 0 ? Color.white : Color.white.opacity(0.5))
                    .padding(.horizontal)
            }
            
            Spacer(minLength: 10)
            
            Button {
                self.index = 1
            } label: {
                Image(systemName: "person.2.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(self.index == 1 ? Color.white : Color.white.opacity(0.5))
                    .padding(.horizontal)
            }
            
            Spacer(minLength: 10)
            
            Button {
                self.index = 2
            } label: {
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(self.index == 2 ? Color.white : Color.white.opacity(0.5))
                    .padding(.horizontal)
            }
            
        }
        .padding(.horizontal, 30)
        .padding(.bottom)
        
    }
    
}



struct cellView: View {
    var data: Msg
    var body: some View {
        HStack(spacing: 12) {
            Image(data.img)
                .resizable()
                .frame(width: 55, height: 55)
            
            VStack(alignment: .leading, spacing: 12){
                Text(data.name)
                
                Text(data.msg)
                    .font(.caption)
            }
            Spacer(minLength: 0)
            
            VStack {
                Text(data.date)
                    .font(.caption2)
                Spacer()
            }
        }
        //.padding(.vertical)
    }
}

struct shape: Shape {
    
    func path(in rect: CGRect) -> Path {
     
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 28, height: 28))
        
        return Path(path.cgPath)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Msg: Identifiable {
    var id: Int
    var name: String
    var msg: String
    var date: String
    var img: String
}

var data = [

    Msg(id: 0, name: "Emily", msg: "Hello, my sweety!", date: "11/07/2022", img: "p1"),
    Msg(id: 1, name: "John", msg: "Hello, how are you!", date: "11/07/2022", img: "p2"),
    Msg(id: 2, name: "Marry", msg: "Hello!", date: "11/07/2022", img: "p3"),
    Msg(id: 3, name: "Nastia", msg: "I love you!", date: "11/07/2022", img: "p4"),
    Msg(id: 4, name: "Steve", msg: "What's up!", date: "11/07/2022", img: "p5"),
    Msg(id: 5, name: "Sherlock", msg: "I'm home", date: "11/07/2022", img: "p6"),
    Msg(id: 6, name: "Catherine", msg: "Put on your cap", date: "11/07/2022", img: "p7"),
    Msg(id: 7, name: "Mike", msg: "Don't forget to call me", date: "11/07/2022", img: "p8"),
    Msg(id: 8, name: "Bob", msg: "I'm late!", date: "11/07/2022", img: "p9"),
    Msg(id: 9, name: "Scotty", msg: "How is your cat?", date: "11/07/2022", img: "p10")
]
