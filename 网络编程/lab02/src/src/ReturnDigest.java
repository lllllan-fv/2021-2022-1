import java.io.FileInputStream;
import java.io.IOException;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class ReturnDigest extends Thread {
    private String filename;
    private byte[] digest;

    public ReturnDigest(String filename) {
        this.filename = filename;
    }

    @Override
    public void run() {
        try {
            FileInputStream in = new FileInputStream(filename);
            MessageDigest sha = MessageDigest.getInstance("SHA-256");
            DigestInputStream din = new DigestInputStream(in, sha);
            din.on(true);
            while (din.read() != -1) ;  //读取整个文件
            din.close();
            sha = din.getMessageDigest();
            digest = sha.digest();
        } catch (IOException ex) {
            System.err.println(ex);
        } catch (NoSuchAlgorithmException ex) {
            System.err.println(ex);
        }
    }

    public byte[] getDigest() {
        return digest;
    }
}
