# GrandMenu


=== 
## GrandMenu 是一个简单且使用方便的菜单工具

**GrandMenu是一个简单且使用方便的菜单工具, 并且提供了一个GrandTableMenu来配套使用,两者配合可以实现类似部分网易新闻的效果**

##Key Features 【关键特点】
* **菜单标题和颜色,字体,以及下面的Bar可以完全自定义**
* **菜单标题和Bar的大小和位置完全是自动分配的**
* **可以自动调整表格的大小**
* **使用Block来回调菜单的点击事件和Table的滚动事件**

##Requirements 【安装需求】

Xcode 9.0 and iOS 8.0(Swift3.0 Version)

##Installation 【安装】
+ **如果你想使用Cocoapods，直接pod 'GrandMenu'，再安装即可**

+ **如果你想使用文件，直接把GrandMenu.swift，GrandMenuItem.swift和GrandMenuTable.swift拷贝到项目即可**



##How To Use It 【如何使用】
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



##Contact 【联系】
Any issue or problem please contact me:3421902@qq.com, I will be happy fix it
**任何问题箐联系我：3421902@qq.com,我会很乐意解决**

