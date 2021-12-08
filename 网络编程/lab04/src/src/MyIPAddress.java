import java.net.InetAddress;
import java.net.UnknownHostException;

public class MyIPAddress {
    public static void main(String[] args) {
        try {
            InetAddress me = InetAddress.getLocalHost();
            String dottedQuad = me.getHostAddress();
            System.out.println("这台主机的IP地址是：" + dottedQuad);
        } catch (UnknownHostException ex) {
            System.out.println("对不起，我不知道这台主机的IP地址。");
        }
    }
}
