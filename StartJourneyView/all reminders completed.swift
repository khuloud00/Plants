
import SwiftUI

struct all_reminders_completed: View {
    var body: some View {
        VStack {
           Text("My Plants 🌱")
               .font(.largeTitle)
               .fontWeight(.bold)
               .padding()
               .frame(maxWidth: .infinity, alignment: .leading)
           Spacer()
           
             VStack {
               Image("plant") // استبدل باسم صورتك
                   .resizable()
                   .scaledToFit()
                   .frame(width: 150, height: 150)
                   .padding(.bottom, 20)
               
               Text("All Done! 🎉")
                   .font(.title)
                   .fontWeight(.bold)
                   .padding(.bottom, 10)
               
               Text("All Reminders Completed")
                   .foregroundColor(.gray)
           }
           
           Spacer()
           
           // زر إضافة تذكير جديد
           HStack {
               Button(action: {
                   // اضف اكشن لاضافة تذكير جديد هنا
               }) {
                   HStack {
                       Image(systemName: "plus.circle.fill")
                       Text("New Reminder")
                   }
                   .font(.title2)
                   .foregroundColor(.green)
               }
               .padding(.leading)
               
               Spacer()
           }
           .padding(.bottom, 40) // لإضافة مسافة من الأسفل
       }
       .background(Color.black.edgesIgnoringSafeArea(.all))
       .foregroundColor(.white)
   }
}
#Preview {
    all_reminders_completed()
}
