//
//  TableContentsView.swift
//  Samples
//
//  Created by Carmelo Uria on 4/27/22.
//

import SwiftUI

// List and Detail view of entity Note
struct TableContentsView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Note.timestamp, ascending: true)],
        animation: .default)
    private var notes: FetchedResults<Note>

    var body: some View {
        NavigationView {
            List {
                ForEach(notes) { note in
                    NavigationLink {
                        Text("Note at \(note.timestamp!, formatter: itemFormatter)")
                        Text("id: \(note.id?.uuidString ?? "unknown")")
                        Text("subject: \(note.subject ?? "unknown")")
                        Text("note: \(note.note ?? "unknown")")
                    } label: {
                        Text(note.timestamp!, formatter: itemFormatter)
                        Text(note.subject ?? "unknown")
                        Text(note.note ?? "unknown")

                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    NavigationLink(destination: NoteDetailView(viewModel: NoteDetailModel())) {
                        Label("Add Item", systemImage: "plus")
                    }
                 }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { notes[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct TableContentsView_Previews: PreviewProvider {
    static var previews: some View {
        TableContentsView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
