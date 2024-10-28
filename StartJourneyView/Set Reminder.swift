import SwiftUI

// نموذج البيانات لتمثيل بيانات التذكير بالنبات
struct PlantReminder: Identifiable {
    var id = UUID() // معرف فريد للتذكير
    var plantName: String
    var room: String
    var wateringDays: String
    var waterAmount: String
    var light: String
    var isChecked: Bool = false
    // حالة التحقق (تم تنفيذ التذكير أم لا)
}

struct Set_Reminder: View {
    @State private var plantReminder = PlantReminder(plantName: "", room: "Bedroom", wateringDays: "Every day", waterAmount: "20-50 ml", light: "Full sun")
    
    @Binding var plantReminders: [PlantReminder] // ربط قائمة التذكيرات مع TodayReminder
    @Environment(\.presentationMode) var presentationMode // للتحكم في إغلاق الصفحة
    
    var body: some View {
        NavigationView {
            Form {
                // قسم اسم النبات
                Section {
                    TextField("Enter plant name", text: $plantReminder.plantName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                // دمج Room و Light داخل نفس القسم مع إضافة الأيقونات
                Section {
                    Picker(selection: $plantReminder.room, label: HStack {
                        Image(systemName: "paperplane")
                        Text("Room")
                    }) {
                        Text("Bedroom").tag("Bedroom")
                        Text("Living Room").tag("Living Room")
                        Text("Kitchen").tag("Kitchen")
                        Text("Balcony").tag("Balcony")
                        Text("Bathroom").tag("Bathroom")
                    }
                    
                    Picker(selection: $plantReminder.light, label: HStack {
                        Image(systemName: "sun.max")
                        Text("Light")
                    }) {
                        Text("Full sun").tag("Full sun")
                        Text("Partial sun").tag("Partial sun")
                        Text("Low light").tag("Low light")
                    }
                }
                
                Section {
                    Picker(selection: $plantReminder.wateringDays, label: HStack {
                        Image(systemName: "drop")
                        Text("Watering Days")
                    }) {
                        Text("Every day").tag("Every day")
                        Text("Every 2 days").tag("Every 2 days")
                        Text("Every 3 days").tag("Every 3 days")
                        Text("Once a week").tag("Once a week")
                        Text("Every 10 days").tag("Every 10 days")
                        Text("Every 2 weeks").tag("Every 2 weeks")
                    }
                    
                    Picker(selection: $plantReminder.waterAmount, label: HStack {
                        Image(systemName: "drop")
                        Text("Water")
                    }) {
                        Text("20-50 ml").tag("20-50 ml")
                        Text("50-100 ml").tag("50-100 ml")
                        Text("100-150 ml").tag("100-150 ml")
                        Text("200-300 ml").tag("200-300 ml")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss() // إغلاق الشاشة عند النقر على "Cancel"
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Set Reminder")
                        .font(.headline)
                        .bold()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveReminder() // تنفيذ عملية الحفظ
                        presentationMode.wrappedValue.dismiss() // إغلاق الشاشة بعد الحفظ
                    }
                }
            }
        }
    }
    
    // دالة لحفظ التذكير
    func saveReminder() {
        plantReminders.append(plantReminder) // إضافة التذكير الجديد إلى قائمة التذكيرات
    }
}

#Preview {
    // استخدم $plantReminders كـ Binding
    Set_Reminder(plantReminders: .constant([PlantReminder]()))
}

