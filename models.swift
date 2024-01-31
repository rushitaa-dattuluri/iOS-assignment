import Foundation

struct Meal: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
}

struct MealDetails: Codable {
    let strMeal: String
    let strInstructions: String
    let ingredients: [String?]

    enum CodingKeys: String, CodingKey {
        case strMeal, strInstructions
        case ingredients = "ingredients"
    }
}
