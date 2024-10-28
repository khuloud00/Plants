import SwiftUI

struct TodayReminder: View {
    @Binding var plantReminders: [PlantReminder] // تعديل قائمة التذكيرات لتكون Binding
    @State private var showAddReminder = false
    @State private var selectedReminder: PlantReminder?
    
    var allRemindersCompleted: Bool {
        plantReminders.allSatisfy { $0.isChecked }
    }

    var body: some View {
        NavigationStack { // Wrap in NavigationStack for iOS 16+
            VStack(alignment: .leading) {
                Text("My Plants 🌱")
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading)
                    .padding(.top)
                
                Text("Today")
                    .font(.title2)
                    .bold()
                    .padding(.leading)
                    .padding(.top, 5)
                
                List {
                    ForEach(plantReminders) { plant in
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: plant.isChecked ? "checkmark.circle.fill" : "circle")
                                    .onTapGesture {
                                        toggleCheck(for: plant)
                                    }
                                
                                VStack(alignment: .leading) {
                                    Text(plant.plantName)
                                        .font(.headline)
                                    Text("in \(plant.room)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                            
                            HStack {
                                Label(plant.light, systemImage: "sun.max")
                                    .foregroundColor(.yellow)
                                Label(plant.waterAmount, systemImage: "drop")
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.vertical)
                        .onTapGesture {
                            selectedReminder = plant
                        }
                    }
                    .onDelete(perform: deleteReminder)
                }
                
                Spacer()
                
                Button(action: {
                    showAddReminder.toggle()
                }) {
                    Label("New Reminder", systemImage: "plus.circle.fill")
                        .foregroundColor(.green)
                        .padding()
                }
                .sheet(isPresented: $showAddReminder) {
                    Set_Reminder(plantReminders: $plantReminders) // تمرير قائمة التذكيرات كـ Binding
                }
                .sheet(item: $selectedReminder) { reminder in
                    EditReminder(plantReminder: Binding(
                        get: { reminder },
                        set: { newValue in
                            if let index = plantReminders.firstIndex(where: { $0.id == newValue.id }) {
                                plantReminders[index] = newValue
                            }
                        }
                    ), plantReminders: $plantReminders)
                }
            }
            .padding()
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: .constant(allRemindersCompleted)) {
                all_reminders_completed()
            }
        }
    }

    func toggleCheck(for plant: PlantReminder) {
        if let index = plantReminders.firstIndex(where: { $0.id == plant.id }) {
            plantReminders[index].isChecked.toggle()
        }
    }

    func deleteReminder(at offsets: IndexSet) {
        plantReminders.remove(atOffsets: offsets)
    }
}

