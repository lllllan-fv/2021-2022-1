import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileStreamsCopy {
    public static void main(String[] args) {
        try {
            FileInputStream fis = new FileInputStream("input.txt");
            FileOutputStream fos = new FileOutputStream("output.txt");
            int c;
            while ((c = fis.read()) != -1) {
                fos.write(c);
                System.out.print((char) c);
            }
            fis.close();
            fos.close();
        } catch (FileNotFoundException e) {
            System.err.println("文件名错：" + e);
        } catch (IOException e) {
            System.err.println("读文件错：" + e);
        }
    }

}
