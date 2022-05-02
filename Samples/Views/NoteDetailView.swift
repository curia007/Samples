//
//  NoteDetailView.swift
//  Notes
//
//  Created by Carmelo Uria on 4/30/22.
//

import SwiftUI

struct NoteDetailView: View {
    @ObservedObject var viewModel: NoteDetailModel

    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext

    
    @State var subject: String = ""
    @State var notes: String = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField(NSLocalizedString("Subject", comment: "Subject"), text: $subject )
                Section(header: Text("Notes")) {
                    TextEditor(text: $notes )
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: addItem) {
                    Label("Save Item", systemImage: "square.and.arrow.down")
                }
                .alert(isPresented: $showingAlert) {
                    Alert (
                        title: Text("Error"),
                        message: Text(viewModel.activeError?.localizedDescription ?? "Unknown Error"),
                         primaryButton: .destructive(Text("OK")) {
                             print("encountered error")
                         },
                         secondaryButton: .cancel()
                    )
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func addItem() {
        withAnimation {
            let newNote = Note(context: viewContext)
            newNote.id = UUID()
            newNote.timestamp = Date()
            newNote.subject = subject
            newNote.note = notes
            
            do {
                try viewContext.save()
                self.presentationMode.wrappedValue.dismiss()
            } catch {
                let nsError = error as NSError
                print("error: \(nsError)")
                viewModel.showAlertView(error: nsError)
                showingAlert = true
            }
        }
    }
    
}

class NoteDetailModel: ObservableObject {
    @Published private(set) var activeError: LocalizedError?

    var isPresentingAlert: Binding<Bool> {
        return Binding<Bool>(get: {
            return self.activeError != nil
        }, set: { newValue in
            guard !newValue else { return }
            self.activeError = nil
        })
    }
    
    func showAlertView(error : NSError) {
        
        let localizedError : Error = Error(description: error.localizedDescription)
        activeError = localizedError
    }

}

extension Alert {
    init(localizedError: LocalizedError) {
        self = Alert(nsError: localizedError as NSError)
    }
    
    init(nsError: NSError) {
        let message: Text? = {
            let message = [nsError.localizedFailureReason, nsError.localizedRecoverySuggestion].compactMap({ $0 }).joined(separator: "\n\n")
            return message.isEmpty ? nil : Text(message)
        }()
        self = Alert(title: Text(nsError.localizedDescription),
                     message: message,
                     dismissButton: .default(Text("OK")))
    }
}

enum LoginError: LocalizedError {
    case incorrectPassword // invalidUserName etc
    
    var errorDescription: String? {
        switch self {
        case .incorrectPassword:
            return "Failed logging in account"
        }
    }
    
    var failureReason: String? {
        switch self {
        case .incorrectPassword:
            return "Entered password was incorrect"
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .incorrectPassword:
            return "Please try again with different password"
        }
    }
}
struct NoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetailView(viewModel: NoteDetailModel())
    }
}
