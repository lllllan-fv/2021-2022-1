# ListView中自定义控件的点击事件失效问题



原因：子控件中存在 `CheckBox`、`EditText` 等需要焦点的组件，这些组件会抢占整个 `Item` 的焦点。



办法：在自定义控件的 `xml` 文件的根中添加 `android:descendantFocusability="blocksDescendants"`

![image-20211111013702577](ListView点击事件失效.assets\image-20211111013702577.png)

