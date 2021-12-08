import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

public class SourceViewer {
    private static String[] arr = new String[]{"https://www.hznu.edu.cn/"};

    public static void main(String[] args) {
        if (arr.length > 0) {
            try {
                //打开 URLConnection进行读取
                URL u = new URL(arr[0]);
                URLConnection uc = u.openConnection();
                try (InputStream raw = uc.getInputStream()) {//自动关闭
                    InputStream buffer = new BufferedInputStream(raw);
                    //将InputStream串链到一个 Reader
                    Reader reader = new InputStreamReader(buffer);
                    int c;
                    while ((c = reader.read()) != -1) {
                        System.out.print((char) c);
                    }
                }
            } catch (MalformedURLException ex) {
                System.err.println(arr[0] + "is not a parseable URL");
            } catch (IOException ex) {
                System.err.println(ex);
            }
        }
    }
}
