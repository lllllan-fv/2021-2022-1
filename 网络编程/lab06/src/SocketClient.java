import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.InetAddress;
import java.net.Socket;

public class SocketClient {
    Socket s = null;
    DataInputStream inStream = null;
    DataOutputStream outStream = null;

    public SocketClient() {
        try {
            init();
            waitData();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }

    void init() throws Exception {
        s = new Socket(InetAddress.getLocalHost(), 7777);
        inStream = new DataInputStream(s.getInputStream());
        outStream = new DataOutputStream(s.getOutputStream());
        s.setSoTimeout(30000);
    }

    void waitData() {
        while (true) {
            try {
                String str = inStream.readUTF();
                System.out.println("Client accept:" + str);
                str = Integer.toString(Integer.parseInt(str) + 1);
                outStream.writeUTF(str);
            } catch (Exception e) {
                System.out.println(e.toString());
                break;
            }
        }
    }

    public static void main(String[] args) {
        new SocketClient();
    }
}
