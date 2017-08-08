import Foundation

extension Data
{
    func writeToTemporal() -> URL?
    {
        let randomName:String = UUID().uuidString
        let directoryUrl:URL = URL(fileURLWithPath:NSTemporaryDirectory())
        let fileUrl:URL = directoryUrl.appendingPathComponent(randomName)
        
        do
        {
            try write(to:fileUrl, options:Data.WritingOptions.atomicWrite)
        }
        catch
        {
            return nil
        }
        
        return fileUrl
    }
}
