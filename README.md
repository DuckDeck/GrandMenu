# GrandMenu
=== 
#####下面有中文说明
##GrandMenu is a powerful and simple Menu

StarReview is a simple and useful menu tool. It has a rotated table and a scrollable menu

##Key Features
* Custom menu title and bar color
* Can assgin menu title's location and size automatically
* Auto adjust the table view.s size.
* use block to callback menu click event and table scroll event

##Requirements 

Xcode 7.1 and iOS 8.0(the lasted swift grammar)

##Installation
`if you want to use cocopods, just pod 'GrandMenu'.`
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
*Check the demo project will help you understand more 

<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/StarReview/master/StarReviewDemo/StarReviewDemo/Resource/1.gif)
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/StarReview/master/StarReviewDemo/StarReviewDemo/Resource/2.gif)
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/StarReview/master/StarReviewDemo/StarReviewDemo/Resource/3.gif)


##Contact 
Any issue or problem please contact me:3421902@qq.com, I will be happy fix it




#中文说明


# StarReview
=== 
##StarReview是一个IOS打分工具，用星星来给某些东西打分

StarReview是一个强大的IOS UI 工具他继承了UIControl 并提供了可定制的包含星星的VIew. 

##关键特点
* 可自适配大小，星的大小由VIew的大小和星星的个数决定
* 可设定任意星星的个数
* 可设定填充颜色和背景色
* 自定义星与星之间的间距
* 可用小数或者整数来表示当前星的分数
* 改变星的值时会触发事伯，当你添加target时

##系统要求 

Xcode 7.1 and iOS 8.0(最新的Swift语法)

##安装
`如果你使用cocopods, 则pod 'StarReview' 再安装即可.`
<br/>
`如果你想使用文件，直接拷贝StarReview.swift到你的项目即可`
<br>


##怎么使用
*请参考以下代码 
```swift
let star = StarReview(frame: CGRect(x: 15, y: 100, width: 200, height: 50)) //初始化 StarReview
```
```swift
star.starMarginScale = 0.3 //设置星与星的间隔长度和星星直径的比例，默认是 0.3
```
```
star.value = 2 //设置 StarReview 的 value
```
```
star.starCount = 5 // 设置StarReview内星星的个数,默认是5个
```
```
star.allowEdit = true // 设置是否可以允许打分，默认是允许
```
```
star.allowAccruteStars = true //设置是否精确化打分，也就是说如果是精确化，就可以用小数，不然只能用整数

```
```
star.starFillColor = UIColor.orangeColor() //设置星星的填充颜色
```
```
star.starBackgroundColor = UIColor.lightGrayColor() //设置星星的背景色
```
```
star.addTarget(self, action: "valueChange:", forControlEvents: UIControlEvents.ValueChanged) // 为StarReview的值改变时添加事件
```
```
view.addSubview(star) //添加StarReview
```
*参考StarReviewDemo会更好的理解StarReview怎么使用

<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/StarReview/master/StarReviewDemo/StarReviewDemo/Resource/1.gif)
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/StarReview/master/StarReviewDemo/StarReviewDemo/Resource/2.gif)
<br>

![add -DDEBUG location](https://raw.githubusercontent.com/DuckDeck/StarReview/master/StarReviewDemo/StarReviewDemo/Resource/3.gif)


##和我联系
任何问题或者BUG请直接和我联系3421902@qq.com, 我会乐于帮你解决
