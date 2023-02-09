import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

@WebServlet(name = "DictionaryServlet", value = "/translate")
public class DictionaryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> map = new LinkedHashMap<>();
        map.put("apple", "táo");
        map.put("mouse", "chuột");
        map.put("cat", "mèo");
        map.put("laptop", "máy tính bảng");
        String search = request.getParameter("txtSearch");
        String result = map.get(search);
        if (result != null) {
            request.setAttribute("result", result);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            request.setAttribute("result", "Not Found");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
