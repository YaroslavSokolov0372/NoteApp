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
    @State var currentCollection: NoteCollection?
    
    @State var isFavorite: Bool = false
    
    @State var rowsOfNotes: [[Note]] = []
    
    
    @State var settingMode: Bool = true

    
    
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
//                        .overlay {
//                                VStack {
//                                    ForEach(colors, id: \.self) { color in
//                                        NavigationLink {
//                                            NoteView(note: Note(context: viewContext),
//                                                     background: color
////                                                textFromNote: "",
////                                                     savedToWhatCollections: [],
//                                            )
//                                                .navigationBarBackButtonHidden(true)
//                                        } label: {
//                                            Capsule()
//                                                .fill(Color(color))
//                                                .frame(width: 40, height: 40)
//                                                .padding(10)
//
//                                        }
//                                        .opacity(homeVM.creatingNewNote ? 1.0 : 0.0)
//
//                                    }
//
//                                }
//                                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                                .offset(y: 190)
//                                .offset(y: homeVM.creatingNewNote ? 50 : 0)
//                        }
                    }
                }
                
                //MARK: -ScrollView for collection
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(collections) { collection in
                            if !collections.isEmpty {
                                Button {
                                    currentCollection = collection
                                    generateGridOfNotesOf(collection)
                                    print(currentCollection ?? "For now its empty")
                                } label: {
                                    HStack {
                                        Text(String(collection.name!))
                                            .lufga(25, .light)
                                            .foregroundColor(.white)
                                        
                                        Text(String(describing: collection.allNotesArray.count))
                                            .lufga(19, .light)
                                            
                                            .background(
                                                Circle()
                                                    .fill(Color("GrayLight"))
                                                    .frame(width: 30, height: 30)
                                                    
                                            )
                                            .padding(.horizontal, 10)
                                            
                                    }
                                    .strokeBackground(padding: 15, cornerRadius: 30)
                                    .foregroundColor(.white)
                                       
                                }
                            }
                        }
                        
                        Button {
                            withAnimation {
                                homeVM.showNewCollection = true
                                homeVM.nameOfCollection = ""
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
                    
                    VStack(spacing: 10) {
                            
                        ForEach(currentCollection?.allNotesArray ?? [], id: \.self) { note in
                            NavigationLink(destination: NoteView(note: note, background: nil).navigationBarBackButtonHidden(true)) {
                                HStack {
                                    VStack(alignment: .leading, spacing: -3) {
                                        //                                        Text(String(note.text!.prefix(18)) + "...")
                                        Text(String(note.name!) + "...")
                                            .foregroundColor(.black)
                                        //                            .frame(width: 80)
                                            .lufga(20, .medium)
                                            .padding(.bottom, 10)
                                        
                                        // MARK - Need to create timeStamp for notes
                                        Text("Opened " + note.formattedTime)
                                            .foregroundColor(.black)
                                            .lufga(15, .light)
                                    }
                                    
                                    .padding(.leading, 4)
                                    
                                    Spacer()
                                    
                                    
                                    
                                }
                                .frame(width: 350, height: 80)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 40)
                                        .fill(Color(note.color!))
                                )
                                
                                
                                .overlay {
                                    Button {
                                        addToFavourites(note, currentCollection!)
                                    } label: {
                                        Image(currentCollection!.favouriteNotesArray.contains(note) ? "HeartRed" : "Heart")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .background(
                                                Circle()
                                                    .fill(Color.black.opacity(0.2))
                                                    .frame(width: 70, height: 70)
                                                
                                                
                                            )
                                        //                                            .onTapGesture {
                                        //                                                withAnimation {
                                        //                                                    isFavorite.toggle()
                                        //                                                }
                                        //                                            }
                                        //                                            .onLongPressGesture(minimumDuration: 1.0) {
                                        //                                                print("LongGesture is working")
                                        //                                            }
                                    }
                                    .offset(x: 150)
                                    .padding(.trailing, 10)
                                    .padding(.bottom, 7)
                                }
                                
                                
//                                .onLongPressGesture(minimumDuration: 1.0) {
//                                    print("LongGesture is working")
//                                }
                            }
                            
                            .onLongPressGesture(minimumDuration: 1.0) {
                                print("LongGesture is working")
                            }
                        }
//                        ForEach(rowsOfNotes.indices, id: \.self) { index in
//
//                            HStack(spacing: 10) {
//
//                                ForEach(rowsOfNotes[index], id: \.self) { note in
//
//                                    NavigationLink(destination: NoteView(note: note, background: nil).navigationBarBackButtonHidden(true)) {
//
//
////                                        Text(note.name!)
////                                            .background(
////                                        RoundedRectangle(cornerRadius: 10)
////                                            .fill(Color(note.color!))
////                                            .frame(width: 175, height: 100)
////                                    )
//
//
//
//                                    }
//
//
//
//                                }
//                            }
//
//                        }
                    }
                    
                }
                .blur(radius: homeVM.creatingNewNote ? 10.0 : 0.0)

            }
            .onAppear {
                homeVM.creatingNewNote = false
                if currentCollection == nil {
                    if let firstCollection = collections.first  {
                        currentCollection = firstCollection
                        generateGridOfNotesOf(currentCollection!)
                    }
                    
                }
                
            }
            .padding(7)
            //MARK: -Creating "New Collection" View
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
                                if !isCollectionNameExist(homeVM.nameOfCollection) {
                                    homeVM.addCollection(managedContext: viewContext)
                                    
                                } else {
                                    print("This name is already exist. Choose another one")
                                }
                            }
                            withAnimation {
                                homeVM.showNewCollection = false
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
            //MARK: -ChooseColor for newNote
            .overlay {
                VStack {
                    ForEach(colors, id: \.self) { color in
                        NavigationLink {
                            NoteView(note: Note(context: viewContext),
                                     background: color
                                     //                                                textFromNote: "",
                                     //                                                     savedToWhatCollections: [],
                            )
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
                .offset(x: 140, y: -130)
                
                
                .offset(y: homeVM.creatingNewNote ? 50 : 0)
            }
        }
    }
    
    func generateGridOfNotesOf(_ noteCollection: NoteCollection) {
        
        self.rowsOfNotes = []
        
        var generated: [Note] = []
        
        var count = 0
        
        for i in noteCollection.notesArray {
            
            generated.append(i)
            
            if rowsOfNotes.isEmpty {
                
                if generated.count == 2 {
                    
                    rowsOfNotes.append(generated)
                    generated.removeAll()
                    count += 1
                }
                
            } else {
                
//                if rowsOfNotes[count - 1].count == 2 {
                if rowsOfNotes.last?.count == 2 {
                    
                    if generated.count == 1 {
                        rowsOfNotes.append(generated)
                        generated.removeAll()
                        count += 1
                    }
                    
                } else {
                    if generated.count == 2 {
                        rowsOfNotes.append(generated)
                        generated.removeAll()
                        count += 1
                    }
                }
            }
        }
    }
    
    func isCollectionNameExist(_ nameToCheck: String) -> Bool {
        
        if collections.contains(where: { collection in
            collection.name == nameToCheck
        }) {
            return true
        } else {
            return false
        }
    }
    
    func addToFavourites(_ note: Note, _ toNoteCollection : NoteCollection) {
        
        if toNoteCollection.favouriteNotesArray.contains(note) {
            toNoteCollection.removeFromFavouriteNotes(note)
            toNoteCollection.addToNotes(note)
        } else {
            toNoteCollection.addToFavouriteNotes(note)
            toNoteCollection.removeFromNotes(note)
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
//            $0.time! < $1.time!
            $0.name! < $1.name!
        }
    }
    
    public var favouriteNotesArray: [Note] {
        let set = favouriteNotes as? Set<Note> ?? []
        
        return set.sorted() {
//            $0.time! < $1.time!
            $0.name! < $1.name!
        }
    }
    
    public var allNotesArray: [Note] {
        let allNotes = favouriteNotesArray + notesArray
        
        return allNotes
    }
    
}

extension Note {
    public var collectionsArray: [NoteCollection] {
        let set = collections as? Set<NoteCollection> ?? []
        return set.sorted {
            $0.name! < $1.name!
        }
    }
    
    public var formattedTime: String {
        
        if time != nil {
            let formater = DateFormatter()
            //        formater.dateFormat = "yyyy-MM-dd"
            formater.dateFormat = "EEEE, MMM dd"
            
            return formater.string(from: time!)
        } else {
            return "Updated 2h ago"
        }
    }
           
}
