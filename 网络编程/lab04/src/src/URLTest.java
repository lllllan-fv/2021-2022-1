import java.net.MalformedURLException;
import java.net.URL;

public class URLTest {
    private static String[] arr = new String[]{"192.168.171.62", "baidu.com", "http://www.baidu.com"};

    public static void main(String args[]) {
        for (int i = 0; i < arr.length; i++) {
            try {
                URL u = new URL(arr[i]);
                System.out.println("这个URL是： " + u);
                System.out.println("使用的协议是：" + u.getProtocol());
                System.out.println("使用者信息是：" + u.getUserInfo());

                String host = u.getHost();
                if (host != null) {
                    int atSign = host.indexOf('@');
                    if (atSign != -1) host = host.substring(atSign + 1);
                    System.out.println("这个主机是：" + host);
                } else {
                    System.out.println("没有主机。");
                }
                System.out.println("端口号是：" + u.getPort());
                System.out.println("路径是：" + u.getPath());
                System.out.println("位置是：" + u.getRef());
                System.out.println("请求参数：" + u.getQuery());
            } catch (MalformedURLException ex) {
                System.err.println(arr[i] + "不是一个URL。");
            }
            System.out.println();
        }
    }
}
