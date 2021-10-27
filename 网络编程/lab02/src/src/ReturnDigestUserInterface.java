import javax.xml.bind.DatatypeConverter;

public class ReturnDigestUserInterface {

    private static final String[] FILES = new String[]{
            "1.txt", "2.txt", "3.txt", "4.txt"
    };

    public static void main(String[] args) throws InterruptedException {
        for (String filename : FILES) {
            // 计算摘要
            ReturnDigest dr = new ReturnDigest(filename);
            dr.start();
            dr.join();
            //现在显示结果
            StringBuilder result = new StringBuilder(filename);
            result.append(": ");
            byte[] digest = dr.getDigest();
            result.append(DatatypeConverter.printHexBinary(digest));
            System.out.println(result);
        }
    }
}
