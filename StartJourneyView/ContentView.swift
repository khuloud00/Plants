import SwiftUI

struct ContentView: View {
    // State variable to hold plant reminders
    @State private var plantReminders: [PlantReminder] = []
    @State private var isShowingTodayReminderSheet = false // State variable to control TodayReminder sheet presentation
    
    var body: some View {
        NavigationView {
            VStack {
                Image("plany")
                    .resizable()
                    .frame(width: 132, height: 164)
                    .padding()
                
                Text("Start your plant journey!")
                    .font(.title)
                    .padding()
                
                Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                    .multilineTextAlignment(.center)
                    .padding()
                
                // Button to present the TodayReminder sheet
                Button(action: {
                    isShowingTodayReminderSheet = true // Show the TodayReminder sheet
                }) {
                    Text("Set Plant Reminder")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 250, height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding()
                .sheet(isPresented: $isShowingTodayReminderSheet) {
                    TodayReminder(plantReminders: $plantReminders) // Present the TodayReminder sheet
                }
            }
            .navigationTitle("My Plants 🌱")
            Divider()
                .background(Color.black)
        }
    }
}

#Preview {
    ContentView()
}

