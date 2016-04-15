# GrandMenu
=== 
##GrandMenu is a powerful and simple Menu  【是一个简单且使用方便的菜单工具】

StarReview is a simple and useful menu tool. It provide GrandTableMenu which is a rotated table to supporting GrandMenu. it achieve neteasy news effects(now completed, but liked)**GrandMenu是一个简单且使用方便的菜单工具, 并且提供了一个GrandTableMenu来配套使用,两者配合可以实现类似部分网易新闻的效果**

##Key Features
* Custom menu title and bar color**菜单标题和颜色,字体,以及下面的Bar可以完全自定义**
* Can assgin menu title's location and size automatically**菜单标题和Bar的大小和位置完全是自动分配的**
* Auto adjust the table view's size.**可以自动调整表格的大小**
* use block to callback menu click event and table scroll event**使用Block来回调菜单的点击事件和Table的滚动事件**

##Requirements 

Xcode 7.2 and iOS 8.0(Swift2.2 Version)

##Installation
+ if you want to use cocopods, just pod 'GrandMenu'.**如果你想使用Cocoapods，直接pod 'GrandMenu'，再安装即可**

+ if you want to use file, just pod copy the GrandMenu.swift，GrandMenuItem.swift and GrandMenuTable.swiftto your project .**如果你想使用文件，直接把GrandMenu.swift，GrandMenuItem.swift和GrandMenuTable.swift拷贝到项目即可**



##How To Use It 
Please see these code below**请参考下面的代码**
```swift
grandMenu = GrandMenu(frame:CGRect(x: 0, y: 64, width: UIScreen.mainScreen().bounds.size.width, height: 40) , titles:  ["First","Second","Third","Fouth","Fifth"]) //init the GrandMenu and assign the menu titles, and also you can assign titles later
grandMenu.arrItemsTitle =  ["First","Second","Third","Fouth","Fifth"]
```
```swift
grandMenu?.itemSeletedColor = UIColor.blueColor() //set the menu title color when it's selected 
```
```
grandMenu?.itemColor = UIColor.greenColor() //set the menu title color when it's not selected
```
```
grandMenu?.itemFont = 14//set the menu title font when it's not selected
grandMenu?.itemSelectedFont = 18//set the menu title font when it's  selected
grandMenu?.sliderBarHeight = 5//set the menu title slider bar height 
grandMenu?.sliderBarLeftRightOffset = 15//set the menu title silder bar left right offset 
grandMenu?.selectMenu = scrollCallback //set the select menu callback
   func scrollCallback(item:GrandMenuItem, index:Int){
        grandMenuTable?.selectIndex(index)
    } //this is the callback func
```
``` 
view.addSubview(grandMenu!) // then add the menu
```
```   
 arrControllers = [UIViewController]() //init the viewControllers array
 let vc1 = Controller1()
 let vc2 = Controller2()
 let vc3 = Controller3()
 let vc4 = Controller4()
 let vc5 = Controller5()
 arrControllers?.append(vc1)
 arrControllers?.append(vc2)
 arrControllers?.append(vc3)
 arrControllers?.append(vc4)
 arrControllers?.append(vc5) //add the viewcontrollers you want
```
```
 grandMenuTable = GrandMenuTable(frame: CGRect(x: 0, y: CGRectGetMaxY(grandMenu!.frame), width: UIScreen.mainScreen().bounds.size.width, height: view.frame.size.height - 104), arrViewControllers: arrControllers!) //use the arrControllers to init the GrandTable
grandMenuTable?.scrollToIndex = scrollToIndex // set the GrandTable callback
func scrollToIndex(index:Int){
    grandMenu?.selectSlideBarItemAtIndex(index)// GrandTable callback, in this func , you need set the GrandMenu selected bar index
}
 view.addSubview(grandMenuTable!) //add the GrandTable
```
```swift
//in the ViewControllers you added, you must add this code.
 override func viewWillLayoutSubviews() { // in the viewControllers  you need set table frame, and this is very important
    tb?.frame = self.view.bounds
 }
```
Check the Demo project will help you understand more 
**参考Demo项目你会更好理解GrandMenu的使用**
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/GrandMenu/master/GrandMenuDemo/GrandMenuDemo/Resource/1.png)
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/GrandMenu/master/GrandMenuDemo/GrandMenuDemo/Resource/2.gif)
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/GrandMenu/master/GrandMenuDemo/GrandMenuDemo/Resource/3.gif)



##Contact 
Any issue or problem please contact me:3421902@qq.com, I will be happy fix it
**任何问题箐联系我：3421902@qq.com,我会很乐意解决**

