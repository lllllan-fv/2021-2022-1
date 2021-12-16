import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

public class ServerClient {
    public ServerClient(int port) {
        Server server = new Server(port);
        server.start();
        Client client = new Client(port);
        client.start();
    }

    public static void main(String[] args) {
        new ServerClient(7777);
    }
}

//服务器线程
class Server extends Thread {
    int port;
    ServerSocket server;
    Socket socket;
    //服务器输出流
    DataOutputStream outStream = null;
    //服务器输入流
    DataInputStream inStream = null;

    public Server(int port) {
        try {
            this.port = port;
            server = new ServerSocket(port);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }

    public void run() {
        try {
            //监听用户连接
            socket = server.accept();
            outStream = new DataOutputStream(socket.getOutputStream());
            inStream = new DataInputStream(socket.getInputStream());
            //服务器准备好，可以进行通讯
            System.out.println("server is ok,please continue!");
            while (true) {
                //读取从客户端发送的信息
                String str = inStream.readUTF();
                System.out.println("The server receive String:" + str);
                //将信息重新向客户端发送
                outStream.writeUTF(str);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }
}

class Client extends Thread {
    //指定通讯端口
    int port;
    Socket socket;
    DataInputStream inStream = null;
    DataOutputStream outStream = null;

    public Client(int port) {
        try {
            this.port = port;
            //建立同本地机子的socket连接
            socket = new Socket(InetAddress.getLocalHost(), port);
            inStream = new DataInputStream(socket.getInputStream());
            outStream = new DataOutputStream(socket.getOutputStream());
            //客户端准备好，可以进行通讯
            System.out.println("client is ok,please continue!");
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }

    public void run() {
        try {
            while (true) {
                byte[] b = new byte[1024];
                String str = "";
                //从键盘读取字符串
                int m = System.in.read(b);
                str = new String(b, 0, 0, m - 1);
                //向服务器发送信息
                outStream.writeUTF(str);
                //从服务器读取信息
                str = inStream.readUTF();
                System.out.println("The client receive String:" + str);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }
}
