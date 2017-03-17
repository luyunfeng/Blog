package cn.blog.entity;

/**
 * Created by lucode on 2017/2/11.
 */
public class Blogger {
    private  int id;
    private  String username;
    private  String password;
    private  String nickname;
    private  String sign;
    private  String touxiang;//放的是路径

    public Blogger(){}
    public  Blogger(int id){
        this.id=id;

    }

    public Blogger(String username, String password, String nickname, String sign, String touxiang) {
        this.username = username;
        this.password = password;
        this.nickname = nickname;
        this.sign = sign;
        this.touxiang = touxiang;
    }

    public Blogger(int id, String username, String password, String nickname, String sign, String touxiang) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.nickname = nickname;
        this.sign = sign;
        this.touxiang = touxiang;
    }

    @Override
    public String toString() {
        return "Blogger{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", sign='" + sign + '\'' +
                ", touxiang='" + touxiang + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getTouxiang() {
        return touxiang;
    }

    public void setTouxiang(String touxiang) {
        this.touxiang = touxiang;
    }

}
