import UIKit

class CHome:Controller<VHome, MHome>
{
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func modelRefresh()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.dispatchRefresh()
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(notifiedSessionLoaded(sender:)),
            name:Notification.sessionLoaded,
            object:nil)
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        view().viewDidAppear()
    }
    
    //MARK: notified
    
    func notifiedSessionLoaded(sender notification:Notification)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.dispatchSessionLoaded()
        }
    }
    
    func notifiedBecameActive(sender notification:Notification)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.dispatchBecameActive()
        }
    }
    
    //MARK: private
    
    private func dispatchSessionLoaded()
    {
        model.loadItems()
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(notifiedBecameActive(sender:)),
            name:NSNotification.Name.UIApplicationDidBecomeActive,
            object:nil)
    }
    
    private func dispatchRefresh()
    {
        view().refresh()
    }
    
    private func dispatchBecameActive()
    {
        view().viewDidAppear()
    }
    
    private func shareGif()
    {
        
    }
    
    private func shareMp4()
    {
        guard
            
            let item:MHomeItem = model.items.first
            
        else
        {
            return
        }
        
        let url:URL = item.url
        share(url:url)
    }
    
    private func share(url:URL)
    {
        let activity:UIActivityViewController = UIActivityViewController(
            activityItems:[url],
            applicationActivities:nil)
        
        if let popover:UIPopoverPresentationController = activity.popoverPresentationController
        {
            popover.sourceView = view
            popover.sourceRect = CGRect.zero
            popover.permittedArrowDirections = UIPopoverArrowDirection.any
        }
        
        present(activity, animated:true, completion:nil)
    }
    
    //MARK: internal
    
    func share()
    {
        let alert:UIAlertController = UIAlertController(
            title:String.localizedController(key:"CHome_alertShareTitle"),
            message:nil,
            preferredStyle:UIAlertControllerStyle.actionSheet)
        
        let actionCancel:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"CHome_alertShareCancel"),
            style:
            UIAlertActionStyle.cancel)
        
        let actionGif:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"CHome_alertShareGif"),
            style:UIAlertActionStyle.default)
        { [weak self] (action:UIAlertAction) in
            
            self?.shareGif()
        }
        
        let actionMp4:UIAlertAction = UIAlertAction(
            title:String.localizedController(key:"CHome_alertShareMp4"),
            style:UIAlertActionStyle.default)
        { [weak self] (action:UIAlertAction) in
            
            self?.shareMp4()
        }
        
        alert.addAction(actionGif)
        alert.addAction(actionMp4)
        alert.addAction(actionCancel)
        
        if let popover:UIPopoverPresentationController = alert.popoverPresentationController
        {
            popover.sourceView = view
            popover.sourceRect = CGRect.zero
            popover.permittedArrowDirections = UIPopoverArrowDirection.up
        }
        
        present(alert, animated:true, completion:nil)
    }
}
