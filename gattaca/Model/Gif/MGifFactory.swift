import Foundation

extension MGif
{
    //MARK: internal
    
    func factoryPath(
        identifier:String,
        directory:URL) -> URL?
    {
        var fileName:String = identifier
        fileName.append(DGif.kExtension)
        let path:URL = directory.appendingPathComponent(fileName)
        
        return path
    }
}
