
从下面的题目中任选一个完成调研报告的撰写：

1. **web前端开发技术的现状及发展趋势**
通过查阅文献资料，了解主要的web开发前端技术，主流前端框架及其对比分析，分析总结前端开发技术的现状及其发展趋势。

2. **Java web开发技术现状及发展趋势**
通过查阅文献资料，了解基于Java的web开发技术及开源框架，总结并阐述技术的发展现状与发展趋势。

3. **web架构设计方法及其演变过程**
通过查阅文献资料，了解Web应用架构的设计方法及其演进过程，并对其进行总结与阐述。

报告要求：
调研报告的内容组织要有条理，段落结构合理，文字阐述具有一定的总结性，字数要求在2500中文字以上，文档格式基本规范：正文字体为宋体小四，段落行间距为固定值25磅。以word文档的形式进行提交。

-------

#### [Java Web 开发发展简介](https://www.jianshu.com/p/bec6736dcc3d)

#### [Java Web 发展史](https://blog.csdn.net/weixin_39893958/article/details/84389384)

#### [Java Web目前主流的框架以及正在兴起的框架](https://blog.csdn.net/kingscoming/article/details/78837809)

#### [主流Java Web开发框架有哪些？](http://c.biancheng.net/view/8115.html)

-----



#### JavaWeb 主要框架

- JSP
  - 功能
    - 可以响应客户端请求，而动态生成 HTML、XML 或其他格式文档的Web网页
  - 优点
    - Java EE标准，这意味着有很大的市场需求和更多的工作机会
    - 上手快速并且相对容易
    - 有大量可用的组件库
  - 缺点：
    - 大量的JSP标签
    - 对REST和安全支持不好
    - 没有一个统一的实现。既有SUN的实现，又有Apache的实现——MyFaces。
- Spring MVC
  - 优点：
    - 对Spring MVC覆盖绑定（overriding binding）、验证（validation）等提供生命周期管理
    - 与许多表示层技术/框架无缝集成：JSP/JSTL、Tiles、Velocity、FreeMarker、Excel、XSL、PDF 等
    - 便于测试——归功于IoC
  - 缺点：
    - 大量的XML配置文件
    - 太过灵活——没有公共的父控制器
    - 没有内置的Ajax支持
- Stripes
  - 优点：
    - 不需要书写XML配置文件
    - 良好的学习文档
    - 社区成员很热心
  - 缺点：
    - 社区比较小
    - 不如其他的项目活跃
    - ActionBean里面的URL是硬编码的
- Struts 2
  - 优点：
    - 架构简单——易于扩展
    - 标记库很容易利用FreeMarker或者Velocity来定制
    - 基于控制器或
    - 者基于页面的导航
  - 缺点：
    - 文档组织得很差
    - 对新特征过分关注
- Tapestry
  - 优点：
    - 一旦学会它，将极大地提高生产率
    - HTML模板——对页面设计师非常有利
    - 每出一个新版本，都会有大量的创新
  - 缺点：
    - 文档过于概念性，不够实用
    - 学习曲线陡峭
    - 发行周期长——每年都有较大的升级
- Wicket
  - 优点：
    - 对Java开发者有利（不是Web开发者）
    - 页面和显示绑定紧密
    - 社区活跃——有来自创建者的支持
  - 缺点：
    - HTML模板和Java代码紧挨着
    - 需要对OO有较好的理解
    - Wicket逻辑——什么都用Java搞定