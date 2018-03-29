package Model;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.TabSettings;
import java.io.FileOutputStream;
import java.util.ArrayList;

/**
 *
 * @author edwar
 */
public class PDFGenerator {

    /**
     * Path to the resulting PDF file.
     */
    public static void generateClassListPDF(String filePath, String courseID, String section) {
        Document document = new Document(PageSize.A4, 50, 50, 50, 50);

        try {
            String formattedCourseID = Course.format(courseID);
            ArrayList<Student> classList = Adviser.getOfficialClassList(formattedCourseID, section);

            PdfWriter.getInstance(document, new FileOutputStream(filePath));
            document.open();

            //Header
            Paragraph ustHeader = new Paragraph("University of Santo Tomas", new Font(FontFamily.HELVETICA, 12));
            ustHeader.setAlignment(Element.ALIGN_CENTER);
            Paragraph iicsHeader = new Paragraph("Faculty of Engineering", new Font(FontFamily.HELVETICA, 12));
            ustHeader.setAlignment(Element.ALIGN_CENTER);
            iicsHeader.setAlignment(Element.ALIGN_CENTER);
            document.add(ustHeader);
            document.add(iicsHeader);
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);

            //Title
            Paragraph classListTitle = new Paragraph(formattedCourseID + " " + section, new Font(FontFamily.HELVETICA, 14));
            classListTitle.setAlignment(Element.ALIGN_CENTER);
            document.add(classListTitle);
            document.add(Chunk.NEWLINE);
            document.add(Chunk.NEWLINE);
            
            //Content
            for (Student student : classList) {
                Paragraph studentData = new Paragraph();
                studentData.setTabSettings(new TabSettings(56f));
                studentData.add(Chunk.TABBING);
                studentData.add(new Chunk(Integer.toString(student.getUserID())));
                studentData.add(Chunk.TABBING);
                studentData.add(Chunk.TABBING);
                studentData.add(Chunk.TABBING);
                studentData.add(Chunk.TABBING);
                studentData.add(new Chunk(student.getLastName().toUpperCase() + " " + student.getFirstName()));
                document.add(studentData);
            }

            // step 5
            document.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        document.close();
    }
}
