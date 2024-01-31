import SwiftUI

struct ContentView: View {
    @State private var dessertMeals: [Meal] = []

    var body: some View {
        NavigationView {
            List(dessertMeals) { meal in
                NavigationLink(destination: MealDetailView(mealID: meal.idMeal)) {
                    Text(meal.strMeal)
                }
            }
            .onAppear {
                fetchDessertMeals()
            }
            .navigationTitle("Dessert Recipes")
        }
    }

    func fetchDessertMeals() {
        MealService.shared.fetchDessertMeals { meals in
            DispatchQueue.main.async {
                self.dessertMeals = meals ?? []
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
