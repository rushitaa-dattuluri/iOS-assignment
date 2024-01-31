import SwiftUI

struct MealDetailView: View {
    let mealID: String
    @State private var mealDetails: MealDetails?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(mealDetails?.strMeal ?? "Loading...")
                    .font(.title)
                Text(mealDetails?.strInstructions ?? "")
                    .padding()

                if let ingredients = mealDetails?.ingredients {
                    Section(header: Text("Ingredients")) {
                        ForEach(ingredients, id: \.self) { ingredient in
                            Text(ingredient ?? "")
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            fetchMealDetails()
        }
    }

    func fetchMealDetails() {
        MealService.shared.fetchMealDetails(byId: mealID) { details in
            DispatchQueue.main.async {
                self.mealDetails = details
            }
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(mealID: "52772")
    }
}
