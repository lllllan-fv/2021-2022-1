import javax.xml.bind.DatatypeConverter;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class DigestRunnable implements Runnable {
    private String filename;

    public DigestRunnable(String filename) {
        this.filename = filename;
    }

    @Override
    public void run() {
        try {
            FileInputStream in = new FileInputStream(filename);
            MessageDigest sha = MessageDigest.getInstance("SHA-256");
            DigestInputStream din = new DigestInputStream(in, sha);
            while (din.read() != -1) ;   //读取整个文件
            din.close();
            byte[] digest = sha.digest();
            System.out.print(filename + ": ");
            System.out.print(DatatypeConverter.printHexBinary(digest));
            System.out.println();
        } catch (IOException ex) {
            System.err.println(ex);
        } catch (NoSuchAlgorithmException ex) {
            System.err.println(ex);
        }

    }

    private static final String[] FILES = {
            "1.txt", "2.txt", "3.txt"
    };

    public static void main(String[] args) throws InterruptedException {
        for (String filename : FILES) {
            DigestRunnable dr = new DigestRunnable(filename);
            Thread t = new Thread(dr);
            t.start();
        }
    }
}
