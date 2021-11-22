package itextDemo;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.io.font.constants.StandardFonts;
import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.JpegImageData;
import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.colors.DeviceRgb;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.AreaBreak;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Div;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.List;
import com.itextpdf.layout.element.ListItem;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.element.Text;
import com.itextpdf.layout.property.AreaBreakType;
import com.itextpdf.layout.property.HorizontalAlignment;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.io.image.ImageDataFactory;

/**
 * Servlet implementation class GeneratePdf
 */
@WebServlet("/getpdf")
public class GeneratePdf extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GeneratePdf() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.reset();
		response.setContentType("application/pdf"); //�����ĵ���ʽ
		response.setHeader("Content-disposition", "attachment; filename=" + "demo.pdf" ); 
		ServletOutputStream out=response.getOutputStream();
		
		PdfWriter writer = new PdfWriter(out);
        PdfDocument pdfDocument = new PdfDocument(writer);
        Document document=new Document(pdfDocument);
        document.add(new Paragraph("Hello World!"));
        //�������壬����б�
        //����PdfFont����
        PdfFont font = PdfFontFactory.createFont(StandardFonts.TIMES_ROMAN);
        
        // ���һ������
        document.add(new Paragraph("Here is:").setFont(font));
        //����һ���б����
        List list = new List()
            .setSymbolIndent(12)
            .setListSymbol("\u2022")
            .setFont(font);
        // ���ListItem����
        list.add(new ListItem("Never gonna give you up"))
            .add(new ListItem("Never gonna let you down"))
            .add(new ListItem("Never gonna run around and desert you"))
            .add(new ListItem("Never gonna make you cry"))
            .add(new ListItem("Never gonna say goodbye"))
            .add(new ListItem("Never gonna tell a lie and hurt you"));
        // ���б���ӵ��ĵ�        
        document.add(list);
        
        //���ͼ��
		String path=this.getServletContext().getRealPath("/images")+"\\harvest.jpg";
		System.out.println(path);
		ImageData imageData=ImageDataFactory.create(path);
		Image harvest = new Image(imageData);
		//harvest.scaleAbsolute(300,200);
		harvest.setAutoScale(true);
		
		Paragraph p = new Paragraph("The Harvest Scene")
				.setTextAlignment(TextAlignment.CENTER)
				.setFontSize(18);
		document.add(p);
		document.add(harvest);
		
		Color myColor = new DeviceRgb(255, 0, 0);
				
		Paragraph p_long=new Paragraph("Though the two remain in regular contact ")
				.setFontSize(14f).add(new Text("Trump").setFontSize(16f).setItalic().setUnderline().setFontColor(myColor))
				.add(" has become increasingly irritated at DeSantis' refusal to publicly dismiss a 2024 bid of his own if the former President himself decides to run. Two people close to the situation said DeSantis has privately assured Trump and others that he has no intention of challenging him in a GOP presidential primary, but they noted that Trump won't be fully satisfied until the governor says so publicly.")
				.setFirstLineIndent(20f);
		
		document.add(p_long);
		
		PdfFont font_song = PdfFontFactory.createFont("STSong-Light", "UniGB-UCS2-H",PdfFontFactory.EmbeddingStrategy.PREFER_EMBEDDED);
		document.add(new Paragraph("��ʳ����һ�ֵ��������н���������Ӱʱ��ԭ���ɱ�̫���������Ĳ��֣��в��ֻ�ȫ�����ܱ�ֱ������������ʹλ�ڵ���Ĺ۲����޷�����ƽʱ���������������������").setFont(font_song).setFirstLineIndent(15f)); 

		document.add(new AreaBreak(AreaBreakType.NEXT_PAGE));
		Paragraph p1 = new Paragraph("���Ա��")
				.setTextAlignment(TextAlignment.CENTER)
				.setFont(font_song)
				.setFontSize(18);
		document.add(p1);
		//��ӱ��
		//�����ܱ���ʽ��һ���ĸ�
		Table table = new Table(new float[] { 150, 80, 80, 80 });
		table.setHorizontalAlignment(HorizontalAlignment.CENTER);//�������ˮƽ����
		//��ͷ
		for(int i=0;i<4;i++){
			table.addCell(new Cell().add(new Paragraph(""+(i+1))));
		}
		//����кϲ�"2"����ϲ�2�е�Ԫ��
		Cell cell=new Cell(2,1).add(new Paragraph("one")).setTextAlignment(TextAlignment.CENTER);
		table.addCell(cell);
		//����кϲ�"3"����ϲ�3��
		cell=new Cell(1,3).add(new Paragraph("two"));
		table.addCell(cell);
		//��ʣ�����
		cell=new Cell().add(new Paragraph("three"));
		table.addCell(cell);
		cell=new Cell().add(new Paragraph("three"));
		table.addCell(cell);
		cell=new Cell().add(new Paragraph("three"));
		table.addCell(cell);
		document.add(table);

		document.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
