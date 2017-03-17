

-- --------------------------------------------------------

--
-- 表的结构 `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL COMMENT '博客文章id',
  `title` varchar(200) NOT NULL COMMENT '博客题目',
  `releaseDate` varchar(32) DEFAULT NULL COMMENT '发布日期',
  `content` text COMMENT '博客内容'
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- 表的结构 `blogger`
--

CREATE TABLE `blogger` (
  `id` int(11) NOT NULL COMMENT '博主id',
  `username` varchar(50) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '登陆密码',
  `nickname` varchar(50) DEFAULT NULL COMMENT '博主昵称',
  `sign` varchar(1000) DEFAULT NULL COMMENT '博主签名',
  `touxiang` text COMMENT '博主头像路径'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- 表的结构 `danmu`
--

CREATE TABLE `danmu` (
  `id` int(11) NOT NULL COMMENT 'danmuid',
  `user` varchar(100) DEFAULT NULL COMMENT '发送人者联系方式',
  `content` varchar(1000) DEFAULT NULL COMMENT '弹幕内容',
  `time` int(11) DEFAULT NULL COMMENT '弹幕播放时间',
  `blog_id` int(11) DEFAULT NULL COMMENT '外键关联具体博客'
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `friendlink`
--

CREATE TABLE `friendlink` (
  `id` int(11) NOT NULL COMMENT '友情链接表id',
  `linkname` varchar(100) DEFAULT NULL COMMENT '友情链接名',
  `linkurl` varchar(200) DEFAULT NULL COMMENT '友情链接url',
  `mail` varchar(200) DEFAULT NULL COMMENT '友链的交换的联系人邮箱'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;




--
-- 表的结构 `leavemsg`
--

CREATE TABLE `leavemsg` (
  `id` int(11) NOT NULL COMMENT '留言 id',
  `user` varchar(50) DEFAULT NULL COMMENT '留言者',
  `mail` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `content` text COMMENT '内容',
  `date` varchar(64) DEFAULT NULL COMMENT '日期'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;



--
-- 表的结构 `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL COMMENT '博客id',
  `tagName` varchar(30) DEFAULT NULL COMMENT '标签名字',
  `blog_id` int(11) NOT NULL COMMENT '关联的博客id'
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;



--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogger`
--
ALTER TABLE `blogger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `danmu`
--
ALTER TABLE `danmu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_id` (`blog_id`);

--
-- Indexes for table `friendlink`
--
ALTER TABLE `friendlink`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leavemsg`
--
ALTER TABLE `leavemsg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_id` (`blog_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客文章id',AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `danmu`
--
ALTER TABLE `danmu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'danmuid',AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `friendlink`
--
ALTER TABLE `friendlink`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '友情链接表id',AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `leavemsg`
--
ALTER TABLE `leavemsg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言 id',AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客id',AUTO_INCREMENT=82;
--
-- 限制导出的表
--

--
-- 限制表 `danmu`
--
ALTER TABLE `danmu`
  ADD CONSTRAINT `danmu_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE;

--
-- 限制表 `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE;
