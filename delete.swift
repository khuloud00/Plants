
import SwiftUI

struct delete: View {
   
        @Binding var plant: PlantReminder // تمرير النبات كمُدخل من النوع Binding
        @Binding var plantReminders: [PlantReminder] // تمرير قائمة النباتات لتحديثها بعد الحذف
        @Environment(\.presentationMode) var presentationMode
        @State private var showEditReminder = false // للتحكم في عرض صفحة التعديل
        
    var body: some View {
        Form {
                    // قسم عرض اسم النبات
                    Section {
                        TextField("Plant Name", text: $plant.plantName)
                            .disabled(true) // منع التعديل على الاسم هنا
                    }
                    
                    // قسم العرض للغرفة والإضاءة
                    Section {
                        HStack {
                            Image(systemName: "paperplane")
                            Text("Room")
                            Spacer()
                            Text(plant.room)
                                .foregroundColor(.gray)
                        }
                        
                        HStack {
                            Image(systemName: "sun.max")
                            Text("Light")
                            Spacer()
                            Text(plant.light)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    // قسم العرض لأيام السقي وكمية الماء
                    Section {
                        HStack {
                            Image(systemName: "drop")
                            Text("Watering Days")
                            Spacer()
                            Text(plant.wateringDays)
                                .foregroundColor(.gray)
                        }
                        
                        HStack {
                            Image(systemName: "drop")
                            Text("Water")
                            Spacer()
                            Text(plant.waterAmount)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    // زر حذف التذكير
                    Section {
                        Button(action: {
                            deleteReminder() // تنفيذ عملية الحذف
                        }) {
                            Text("Delete Reminder")
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                }
                .navigationBarTitle("Set Reminder", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            presentationMode.wrappedValue.dismiss() // إغلاق الشاشة
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            saveChanges() // تنفيذ الحفظ (إضافة دالة للحفظ هنا إذا كانت مطلوبة)
                            presentationMode.wrappedValue.dismiss() // إغلاق الشاشة
                        }
                    }
                }
            }
            
            // دالة الحذف
            func deleteReminder() {
                if let index = plantReminders.firstIndex(where: { $0.id == plant.id }) {
                    plantReminders.remove(at: index) // حذف التذكير من القائمة
                    presentationMode.wrappedValue.dismiss() // إغلاق الصفحة بعد الحذف
                }
            }
            
            // دالة الحفظ (إضافة أي منطق إضافي للحفظ إذا لزم الأمر)
            func saveChanges() {
                // هنا يمكنك إضافة منطق الحفظ المطلوب
            }
        }
    


#Preview {
    delete()
}
