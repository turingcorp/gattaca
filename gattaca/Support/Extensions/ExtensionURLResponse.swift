import Foundation

extension URLResponse
{
    var statusCode:Int?
    {
        get
        {
            guard
                
                let response:HTTPURLResponse = self as? HTTPURLResponse
                
            else
            {
                return nil
            }
            
            return response.statusCode
        }
    }
}
