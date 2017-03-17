package cn.blog.service;


import cn.blog.dao.FriendlinkDao;
import cn.blog.entity.Friendlink;

import java.util.List;

/**
 * Created by lucode on 2017/2/22.
 */
public class FriendlinkService {
    private FriendlinkDao friendlinkDao;
    public void setFriendlinkDao(FriendlinkDao friendlinkDao) {
        this.friendlinkDao=friendlinkDao;
    }
    // 添加 友链
    public void addFriendlink(Friendlink friendlink){
        friendlinkDao.addFriendlink(friendlink);
    }
    public List<Friendlink> getAllFriendlink(){
        return friendlinkDao.getAllFriendlink();
    }
    public void deleteFriendlink(int id){
        friendlinkDao.deleteFriendlink(id);
    }
}
