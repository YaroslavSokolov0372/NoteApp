//
//  NoteVIew.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 24/06/2023.
//

import SwiftUI




struct NoteView: View {
    
    
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) var collections: FetchedResults<NoteCollection>
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var note: Note?
    var background: String?
    
    
    @State var toWhatCollectionSave: [NoteCollection] = []
    @State var text: String = ""
    
    @State var showCollections: Bool = false
    @FocusState var texting: Bool


    
    
    var body: some View {
        NavigationView {
            ZStack {
                if background != nil {
                    Color(background!)
                        .ignoresSafeArea()
                } else {
                    Color(note?.color ?? "PastelGreen")
                        .ignoresSafeArea()
                }
                VStack {
                    //MARK: -Collections
                    if showCollections {
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(collections, id: \.id) { collection in
                                    Button {
                                        if !toWhatCollectionSave.contains(collection) {
                                            toWhatCollectionSave.append(collection)
                                        } else {
                                            if let indexToRemove = toWhatCollectionSave.firstIndex(of: collection) {
                                                toWhatCollectionSave.remove(at: indexToRemove)
                                            }
                                        }
                                    } label: {
                                        Text(String(collection.name!))
                                            .lufga(25, .light)
                                            .strokeBackground(padding: 15, cornerRadius: 30)
                                            .foregroundColor(.black)
                                            .opacity(toWhatCollectionSave.contains(collection) ? 1 : 0.5)
                                    }
                                    
                                }
                            }
                            .padding(.horizontal, 15)
                        }
                    }
                    //MARK: -MainTextField
                    TextField("Here comes the text...", text: $text, axis: .vertical)
                        .focused($texting)
                        .foregroundColor(.black)
                        .submitLabel(.return)
                        .lufga(20, .regular)
                        .padding(.horizontal ,20)
                        .padding(.top, 7)
                    
                    
                    Spacer()
                }
                .padding(.top, 20)
                
                //MARK: -ToolbarItems
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                            
                            addNote()
                            
                        } label: {
                            Image("BackButton")
                                .resizable()
                                .frame(width: 29, height: 28)
                                .offset(x: -1)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 35)
                                    
                                        .fill(.black.opacity(0.2))
                                    
                                    
                                )
                        }
                        
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            withAnimation(.easeInOut(duration: 0.15)) {
                                if texting {
                                    texting.toggle()
                                } else {
                                    showCollections.toggle()
                                }
                            }
                        } label: {
                            Image(texting ? "Tick" : "MenuButton")
                                
                                .resizable()
                                .frame(width: 28, height: 28)
                                .offset(x: -1)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 35)
                                        .fill(.black.opacity(0.2))
                                    
                                )
                                .animation(.default.speed(2.5), value: texting)
                        }
                    }
                }
                .onAppear {
                    text = note?.text ?? ""
                    toWhatCollectionSave = note?.collectionsArray ?? []
                    
                }
            }
        }
    }
    
    private func addNote() {
//        note.id = UUID()
        note!.name = firstWordOf(text)
        note!.text = text
        note!.time = .now
        if note!.color == nil {
            note!.color = background ?? "PastelGreen"
        }
        for collection in toWhatCollectionSave {
            if !collection.notesArray.contains(note!) {
                collection.addToNotes(note!)
            }
        }
        
        try? viewContext.save()
        print("Saved note to collections - \(toWhatCollectionSave)")

    }
    
    func firstWordOf(_ text: String) -> String {
        return text.components(separatedBy: " ").first ?? ""
    }
    
}

struct NoteVIew_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
//            .preferredColorScheme(.dark)
    }
}








