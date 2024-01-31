import Foundation

class MealService {
    static let shared = MealService()

    func fetchDessertMeals(completion: @escaping ([Meal]?) -> Void) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            do {
                let meals = try JSONDecoder().decode([String: [Meal]].self, from: data)
                completion(meals["meals"])
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }

    func fetchMealDetails(byId mealId: String, completion: @escaping (MealDetails?) -> Void) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            do {
                let mealDetails = try JSONDecoder().decode([String: [MealDetails]].self, from: data)
                completion(mealDetails["meals"]?.first)
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
