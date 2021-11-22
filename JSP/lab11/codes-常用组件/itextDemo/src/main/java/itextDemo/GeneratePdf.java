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
		response.setContentType("application/pdf"); //设置文档格式
		response.setHeader("Content-disposition", "attachment; filename=" + "demo.pdf" ); 
		ServletOutputStream out=response.getOutputStream();
		
		PdfWriter writer = new PdfWriter(out);
        PdfDocument pdfDocument = new PdfDocument(writer);
        Document document=new Document(pdfDocument);
        document.add(new Paragraph("Hello World!"));
        //设置字体，添加列表
        //创建PdfFont对象
        PdfFont font = PdfFontFactory.createFont(StandardFonts.TIMES_ROMAN);
        
        // 添加一个段落
        document.add(new Paragraph("Here is:").setFont(font));
        //创建一个列表对象
        List list = new List()
            .setSymbolIndent(12)
            .setListSymbol("\u2022")
            .setFont(font);
        // 添加ListItem对象
        list.add(new ListItem("Never gonna give you up"))
            .add(new ListItem("Never gonna let you down"))
            .add(new ListItem("Never gonna run around and desert you"))
            .add(new ListItem("Never gonna make you cry"))
            .add(new ListItem("Never gonna say goodbye"))
            .add(new ListItem("Never gonna tell a lie and hurt you"));
        // 将列表添加到文档        
        document.add(list);
        
        //添加图像
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
		document.add(new Paragraph("月食，是一种当月球运行进入地球的阴影时，原本可被太阳光照亮的部分，有部分或全部不能被直射阳光照亮，使位于地球的观测者无法看到平时所看到的月相的天文现象。").setFont(font_song).setFirstLineIndent(15f)); 

		document.add(new AreaBreak(AreaBreakType.NEXT_PAGE));
		Paragraph p1 = new Paragraph("测试表格")
				.setTextAlignment(TextAlignment.CENTER)
				.setFont(font_song)
				.setFontSize(18);
		document.add(p1);
		//添加表格
		//创建总表形式（一行四格）
		Table table = new Table(new float[] { 150, 80, 80, 80 });
		table.setHorizontalAlignment(HorizontalAlignment.CENTER);//表格整体水平居中
		//表头
		for(int i=0;i<4;i++){
			table.addCell(new Cell().add(new Paragraph(""+(i+1))));
		}
		//表格行合并"2"代表合并2行单元格
		Cell cell=new Cell(2,1).add(new Paragraph("one")).setTextAlignment(TextAlignment.CENTER);
		table.addCell(cell);
		//表格列合并"3"代表合并3列
		cell=new Cell(1,3).add(new Paragraph("two"));
		table.addCell(cell);
		//将剩余格补齐
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
