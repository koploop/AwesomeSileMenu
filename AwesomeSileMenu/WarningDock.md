
**这个是用来记录写此Demo的过程中的一些错误点或者需要记住的点,亦或是一些思考**

1.很久没有从storyboard种拉segues,今天使用的时候,我把一个segues拉成了push,但是发现它不起作用,后来改成了show可以了,才知道原来在iOS8中Apple已经废弃了push和modal,替换成了show和present modally;

2.Swift中,当用来标示一个变量不为nil时,好像大部分都是这么写的
```
if let newMenuIem = menuItem {
     view.backgroundColor = UIColor(colorArray: newMenuIem["colors"] as! NSArray)
     backImageView?.image = UIImage(named: newMenuIem["bigImage"] as! String)
}
```
就是用一个常量接收一下,这个在学习Swift时候自己留意一下吧

3.安装到自己的手机上之后发现状态栏一片黑色,所以设置了一下,现在info.plist中添加一个key,名字为View controller-based status bar appearance，并将其值设置为NO,再在Appdelegate中添加UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent