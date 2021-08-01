// ContentView.swift
// MARK: SOURCE -
// 🌸 Conditional saving of NSManagedObjectContext : https://www.hackingwithswift.com/books/ios-swiftui/conditional-saving-of-nsmanagedobjectcontext

// MARK: - LIBRARIES -

import SwiftUI



struct ContentView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @Environment(\.managedObjectContext) var moc
   @FetchRequest(entity: Wizard.entity(),
                 sortDescriptors: []) var wizards: FetchedResults<Wizard>
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      VStack {
         List {
            ForEach(wizards,
                    id: \.self) { (wizard: Wizard) in
               Text(wizard.computedName)
            }
         }
         VStack(spacing: 20) {
            Button("Create Wizard") {
               let newWizard: Wizard = Wizard(context: self.moc)
               newWizard.name = "Dorothy Gale"
            }
            Button("Save Wizard") {
               if moc.hasChanges { // 🌸
                  do {
                     try self.moc.save()
                  } catch let error {
                     print(error.localizedDescription)
                  }
               }
            }
         }
         .padding()
      }
   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContentView()
   }
}
