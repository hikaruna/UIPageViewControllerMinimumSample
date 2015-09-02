import UIKit

class RootViewController: UIPageViewController, UIPageViewControllerDataSource {

    var pageData: [String] = ["hoge","piyo","fuga"]
    var index = 0


    var pageViewController: UIPageViewController?


    override func viewDidLoad() {
        super.viewDidLoad()

        let startingViewController: DataViewController = viewControllerAtIndex(0)!
        let viewControllers = [startingViewController]
        setViewControllers(viewControllers, direction: .Forward, animated: false, completion: {done in })

        dataSource = self
    }
    
    private func viewControllerAtIndex(index: Int) -> DataViewController? {
        // Return the data view controller for the given index.
        if (self.pageData.count == 0) || (index >= self.pageData.count) {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        let dataViewController = storyboard!.instantiateViewControllerWithIdentifier("DataViewController") as! DataViewController
        dataViewController.dataObject = self.pageData[index]
        return dataViewController
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        return self.viewControllerAtIndex(--index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        return self.viewControllerAtIndex(++index)
    }
}

