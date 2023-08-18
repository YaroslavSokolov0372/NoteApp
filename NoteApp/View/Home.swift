//
//  Home.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 22/06/2023.
//

import SwiftUI

struct Home: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) var collections: FetchedResults<NoteCollection>
    //    @EnvironmentObject var dataController: DataController
    //    @FetchRequest(sortDescriptors: []) var notes: FetchedResults<Note>
    @StateObject var homeVM: HomeViewModel = HomeViewModel()
    @State var currentCollection: NoteCollection? = nil
    
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    // MARK: -Title
                    VStack(alignment: .leading, spacing: -10) {
                        Text("My")
                            .lufga(65, .regular)
                        Text("Notes")
                            .lufga(65, .regular)
                        Spacer()
                    }
                    .padding(10)
                    .hAlignment(.leading, 160)
                    
                    //MARK: -Create new Note
                    VStack {
                        Button {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                                homeVM.creatingNewNote.toggle()
                            }

                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 27))
                                .foregroundColor(.white)
                                .padding()
                                .rotationEffect(.degrees(homeVM.creatingNewNote ? 45.0 : 0.0))
                                .scaleEffect(homeVM.creatingNewNote ? 1.1 : 1.0)
                                .background(
                                    Capsule()
                                        .fill(Color("GrayDark"))
                                    
                                    
                                )
                            
                        }
                        .background(
                                BlurView(style: .systemUltraThinMaterial)
                                    .frame(width: 2000, height: 2000)
                                    .opacity(homeVM.creatingNewNote ? 1.0 : 0.0)
                        )
                        .scaleEffect(homeVM.creatingNewNote ? 1.1 : 1.0)
                        .padding(.horizontal, 20)
                        .overlay {
                                VStack {
                                    ForEach(colors, id: \.self) { color in
                                        NavigationLink {
                                            NoteView(textFromNote: "",
                                                     background: color, savedToWhatCollections: [])
                                                .navigationBarBackButtonHidden(true)
                                        } label: {
                                            Capsule()
                                                .fill(Color(color))
                                                .frame(width: 40, height: 40)
                                                .padding(10)
                                            
                                        }
                                        .opacity(homeVM.creatingNewNote ? 1.0 : 0.0)
                                        
                                    }
                                    
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .offset(y: 190)
                                .offset(y: homeVM.creatingNewNote ? 50 : 0)
                        }
                    }
                }
                
                //MARK: -ScrollView for collection
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(collections) { collection in
                            if !collections.isEmpty {
                                Button {
                                    currentCollection = collection
                                    print(currentCollection ?? "For now its empty")
                                } label: {
                                    Text(String(collection.name!))
                                        .lufga(25, .light)
                                        .strokeBackground(padding: 15, cornerRadius: 30)
                                        .foregroundColor(.white)
                                }
                                
                            }
                        }
                        
                        Button {
                            withAnimation {
                                homeVM.showNewCollection = true
                            }
                        } label: {
                            Image(systemName: "plus")
                                .lufga(25, .light)
                                .foregroundColor(.white)
                        }
                        .strokeBackground(padding: 15, cornerRadius: 30)
                        
                    }
                }
                .blur(radius: homeVM.creatingNewNote ? 10.0 : 0.0)

                .padding(.bottom, 25)
                .padding(.top, 15)
                //MARK: -ScrollView for notes of collection
                ScrollView(.vertical, showsIndicators: false) {
                    HStack {
                        if currentCollection != nil {
                            ForEach(currentCollection?.notesArray ?? []) { note in
                                NavigationLink(destination: NoteView(textFromNote: note.text ?? "",
                                                                     background: note.color ?? "PastelGreen",
                                                                     savedToWhatCollections: note.collectionsArray)
                                                                .navigationBarBackButtonHidden(true)) {
                                                        
                                    Text(note.name ?? "")
                                        .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color("PastelGreen"))
                                        )
                                }
                            }
                        }
                    }
                    
                }
                .blur(radius: homeVM.creatingNewNote ? 10.0 : 0.0)

            }
            .onAppear {
                homeVM.creatingNewNote = false
            }
            .padding(7)
            //MARK: -Creating New Collection View
            .overlay {
                VStack {
                    Text("Create a new collection")
                        .lufga(27, .regular)
                        .padding(.horizontal, 10)
                    
                    TextField("Name of Collection", text: $homeVM.nameOfCollection)
                        .padding(.horizontal, 30)
                    HStack {
                        Button {
                            if !homeVM.nameOfCollection.isEmpty {
                                homeVM.addCollection(managedContext: viewContext)
                            }
                        } label: {
                            Text("Create")
                                .foregroundColor(.white)
                                .lufga(16, .regular)
                        }
                        .strokeBackground(padding: 15, cornerRadius: 10)
                        .padding(.trailing, 30)
                        
                        
                        Button {
                            withAnimation {
                                homeVM.showNewCollection = false
                            }
                        } label: {
                            Text("Cancel")
                                .foregroundColor(.white)
                                .lufga(16, .regular)
                        }
                        .strokeBackground(padding: 15, cornerRadius: 10)
                        .padding(.leading, 30)
                        
                    }
                    .padding(.top, 20)
                }
                .frame(width: 350)
                .strokeBackground(padding: 15, cornerRadius: 30)
                .background(.black)
                .offset(y: homeVM.showNewCollection ? -95 : -80)
                .opacity(homeVM.showNewCollection ? 1.0 : 0.0)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension NoteCollection {
    public var notesArray: [Note] {
        let set = notes as? Set<Note> ?? []
        
        return set.sorted {
            $0.name! < $1.name!
        }
    }
}

extension Note {
    public var collectionsArray: [NoteCollection] {
        let set = collections as? Set<NoteCollection> ?? []
        return set.sorted {
            $0.name! < $1.name!
        }
    }
}
