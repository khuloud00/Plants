import SwiftUI

struct EditReminder: View {
    @Binding var plantReminder: PlantReminder // ربط التذكير الذي سيتم تعديله
    @Binding var plantReminders: [PlantReminder] // ربط قائمة التذكيرات
    @Environment(\.presentationMode) var presentationMode // للتحكم في إغلاق الصفحة

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter plant name", text: $plantReminder.plantName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                Section {
                    Picker("Room", selection: $plantReminder.room) {
                        Text("Bedroom").tag("Bedroom")
                        Text("Living Room").tag("Living Room")
                        Text("Kitchen").tag("Kitchen")
                        Text("Balcony").tag("Balcony")
                        Text("Bathroom").tag("Bathroom")
                    }
                    
                    Picker("Light", selection: $plantReminder.light) {
                        Text("Full sun").tag("Full sun")
                        Text("Partial sun").tag("Partial sun")
                        Text("Low light").tag("Low light")
                    }
                }

                Section {
                    Picker("Watering Days", selection: $plantReminder.wateringDays) {
                        Text("Every day").tag("Every day")
                        Text("Every 2 days").tag("Every 2 days")
                        Text("Every 3 days").tag("Every 3 days")
                        Text("Once a week").tag("Once a week")
                        Text("Every 10 days").tag("Every 10 days")
                        Text("Every 2 weeks").tag("Every 2 weeks")
                    }
                    
                    Picker("Water Amount", selection: $plantReminder.waterAmount) {
                        Text("20-50 ml").tag("20-50 ml")
                        Text("50-100 ml").tag("50-100 ml")
                        Text("100-150 ml").tag("100-150 ml")
                        Text("200-300 ml").tag("200-300 ml")
                    }
                }
                
                // زر الحذف
                Section {
                    Button(action: {
                        deleteReminder()
                    }) {
                        Text("Delete Reminder")
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity) // لجعل الزر يمتد بالكامل
                            .padding()
                            .background(Color.red.opacity(0.1))
                            .cornerRadius(8)
                    }
                }
            }
            .navigationBarTitle("Edit Reminder", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss() // إغلاق الشاشة عند النقر على "Cancel"
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        presentationMode.wrappedValue.dismiss() // إغلاق الشاشة بعد الحفظ
                    }
                }
            }
        }
    }
    
    // دالة لحذف التذكير
    private func deleteReminder() {
        if let index = plantReminders.firstIndex(where: { $0.id == plantReminder.id }) {
            plantReminders.remove(at: index) // حذف التذكير من القائمة
            presentationMode.wrappedValue.dismiss() // إغلاق الصفحة بعد الحذف
        }
    }
}

struct EditReminder_Previews: PreviewProvider {
    static var previews: some View {
        EditReminder(plantReminder: .constant(PlantReminder(plantName: "Rose", room: "Living Room", wateringDays: "Every day", waterAmount: "50-100 ml", light: "Full sun")),
                     plantReminders: .constant([PlantReminder(plantName: "Rose", room: "Living Room", wateringDays: "Every day", waterAmount: "50-100 ml", light: "Full sun")]))
    }
}

