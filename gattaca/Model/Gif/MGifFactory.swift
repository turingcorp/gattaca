import Foundation

extension MGif
{
    //MARK: internal
    
    class func factoryPath(
        identifier:String,
        directory:URL) -> URL?
    {
        var fileName:String = identifier
        fileName.append(MGif.kVideoExtension)
        let path:URL = directory.appendingPathComponent(fileName)
        
        return path
    }
}
