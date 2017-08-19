import Foundation

extension DGif
{
    //MARK: internal
    
    func factoryPath(directory:URL) -> URL?
    {
        guard
            
            let identifier:String = self.identifier
            
        else
        {
            return nil
        }
        
        var fileName:String = identifier
        fileName.append(DGif.kExtension)
        let path:URL = directory.appendingPathComponent(fileName)
        
        return path
    }
}
