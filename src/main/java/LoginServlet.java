import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ServletContext servletContext = getServletContext();

        String navn = request.getParameter("navn");
        String kodeord = request.getParameter("kodeord");

        if (servletContext.getAttribute("brugerMap") == null) {
            Map<String, String> brugerMap = new HashMap<>();

            brugerMap.put("test", "test");
            brugerMap.put("admin", "1234");

            servletContext.setAttribute("brugerMap", brugerMap);
        }

        if (!((Map<String, String>) servletContext.getAttribute("brugerMap")).containsKey(navn)) {
            // todo Gå til loginside
            response.getWriter().println("Brugeren findes.");
            request.setAttribute("besked", "Du har ingen bruger. Opret dig her.");
            request.getRequestDispatcher("WEB-INF/opretbruger.jsp").forward(request, response);
        }

        if (((Map<String, String>) servletContext.getAttribute("brugerMap")).get(navn).equalsIgnoreCase(kodeord)) {
            if (navn.equalsIgnoreCase("admin")) {
                request.getRequestDispatcher("WEB-INF/admin.jsp").forward(request, response);
            }
            request.getRequestDispatcher("WEB-INF/huskeliste.jsp").forward(request, response);
        }
        // todo Gå til login dvs. indexsiden
        request.setAttribute("besked", "Kodeordet er forkert. Prøv igen.");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}