import java.io.IOException;
import java.net.Socket;
import java.net.SocketException;
import java.net.UnknownHostException;

public class SocketInfo {

    private static String[] arr = new String[]{"www.hznu.edu.cn"};

    public static void main(String[] args) {
        for (String host : arr) {
            try {
                Socket theSocket = new Socket(host, 80);
                System.out.println("Connected to " + theSocket.getInetAddress()
                        + "on port " + theSocket.getPort() + " from port "
                        + theSocket.getLocalPort() + " of "
                        + theSocket.getLocalAddress());
            } catch (UnknownHostException ex) {
                System.err.println("I can't find " + host);
            } catch (SocketException ex) {
                System.err.println("Could not connect to " + host);
            } catch (IOException ex) {
                System.err.println(ex);
            }
        }
    }
}
