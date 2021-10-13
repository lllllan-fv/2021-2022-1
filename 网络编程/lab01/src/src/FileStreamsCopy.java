import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileStreamsCopy {
    public static void main(String[] args) {
        try {
            byte[] buffer = new byte[1024];
            FileInputStream fis = new FileInputStream("input.txt");
            FileOutputStream fos = new FileOutputStream("output.txt");
            int c;
            while((c = fis.read(buffer, 0, 255))!= -1) {
                fos.write(c);
                System.out.println(new String(buffer, 0));
            }
            fis.close();
            fos.close();
        } catch(FileNotFoundException e) {
            System.err.println("文件名错：" + e);
        } catch(IOException e) {
            System.err.println("读文件错：" + e);
        }
    }

}
