# GrandMenu
=== 
#####下面有中文说明
##GrandMenu is a powerful and simple Menu

StarReview is a simple and useful menu tool. It provide GrandTableMenu which is a rotated table to supporting GrandMenu. it achieve neteasy news effects(now completed, but liked)

##Key Features
* Custom menu title and bar color
* Can assgin menu title's location and size automatically
* Auto adjust the table view's size.
* use block to callback menu click event and table scroll event

##Requirements 

Xcode 7.1 and iOS 8.0(the lasted swift grammar)

##Installation
`if you want to use cocopods, just pod 'GrandMenu'.`
<br>
`if you want to use file, just pod copy the GrandMenu.swift to your project .`
<br>


##How To Use It 
*Please see these code below
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
grandMenuTable = GrandMenuTable(frame: CGRect(x: 0, y: 104, width: UIScreen.mainScreen().bounds.size.width, height: view.frame.size.height - 104), arrContent: arrControllers!) //use the arrControllers to init the GrandTable
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
*Check the demo project will help you understand more 

<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/GrandMenu/master/GrandMenuDemo/GrandMenuDemo/Resource/1.png)
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/GrandMenu/master/GrandMenuDemo/GrandMenuDemo/Resource/2.gif)
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/GrandMenu/master/GrandMenuDemo/GrandMenuDemo/Resource/3.gif)

0.0.4
Update Swift 2.2 compatible

0.0.3 version add a new feature:
you can add a line under the GrandMenu,

##Contact 
Any issue or problem please contact me:3421902@qq.com, I will be happy fix it




#中文说明


# GrandMenu
=== 
##GrandMenu是一个简单且使用方便的菜单工具

GrandMenu是一个简单且使用方便的菜单工具, 并且提供了一个GrandTableMenu来配套使用,两者配合可以实现类似部分网易新闻的效果

##关键特点
* 菜单标题和颜色,字体,以及下面的Bar可以完全自定义
* 菜单标题和Bar的大小和位置完全是自动分配的
* 可以自动调整表格的大小
* 使用Block来回调菜单的点击事件和Table的滚动事件


##系统要求 

Xcode 7.1 and iOS 8.0(最新的Swift语法)

##安装
`如果你使用cocopods, 则pod 'GrandMenu' 再安装即可.`
<br/>
`如果你想使用文件，直接拷贝GrandMenu.swift到你的项目即可`
<br>


##怎么使用
*请参考以下代码 
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
grandMenuTable = GrandMenuTable(frame: CGRect(x: 0, y: 104, width: UIScreen.mainScreen().bounds.size.width, height: view.frame.size.height - 104), arrContent: arrControllers!) //use the arrControllers to init the GrandTable
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
*参考GrandMenuDemo会更好的理解GrandMenu怎么使用

<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/GrandMenu/master/GrandMenuDemo/GrandMenuDemo/Resource/1.png)
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/GrandMenu/master/GrandMenuDemo/GrandMenuDemo/Resource/2.gif)
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/GrandMenu/master/GrandMenuDemo/GrandMenuDemo/Resource/3.gif)
0.0.4
升级为Swift2.2版本
0.0.3 版本加了个新功能:
你可以地GrandMenu下面加一条线,

##和我联系
任何问题或者BUG请直接和我联系3421902@qq.com, 我会乐于帮你解决
