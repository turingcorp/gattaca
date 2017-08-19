import Foundation

extension MGifStrategyDownload
{
    //MARK: private
    
    private func downloadSuccess(gif:DGif)
    {
//        gif.statusWaiting()
        downloadWithDelay()
        
        NotificationCenter.default.post(
            name:Notification.gifDownloaded,
            object:nil)
    }
    
    //MARK: internal
    
    func requestSuccess(gif:DGif, data:Data)
    {
        guard
            
            let directory:URL = DGif.gifDirectory(),
            let gifPath:URL = gif.factoryPath(
                directory:directory)
            
        else
        {
            downloadFailed(gif:gif)
            
            return
        }
        
        do
        {
            try data.write(
                to:gifPath,
                options:Data.WritingOptions.atomicWrite)
        }
        catch
        {
            downloadFailed(gif:gif)
            
            return
        }
        
        downloadSuccess(gif:gif)
    }
}
