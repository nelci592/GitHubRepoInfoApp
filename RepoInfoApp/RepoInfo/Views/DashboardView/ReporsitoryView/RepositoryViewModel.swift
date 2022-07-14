import Foundation

final class RepositoryViewModel: ObservableObject{
    
    func setImage(repositoryLanguage: String) -> String {
        let language = repositoryLanguage
        
        switch language {
        case "Dart":
            return("dart")
            
        case "PHP":
            return ("php")
            
        default:
            return("homer")
        }
    }
    
    func formatStringDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let newDate = dateFormatter.date(from: String(date.dropLast()))
        dateFormatter.setLocalizedDateFormatFromTemplate("MM d, yyyy")
        return dateFormatter.string(from: newDate!)
    }
    
}
