package Filter;

import DAO.CoachDao;
import DAO.MemberDao;
import DTO.Coach;
import DTO.Member;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code, if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Get the session, but don't create a new one if it doesn't exist
        HttpSession session = httpRequest.getSession(false);

        // If session exists and user is logged in, continue
        if (session != null && session.getAttribute("id") != null) {
            chain.doFilter(request, response);
            return;
        }

        // If no session, check for "remember me" cookies
        Cookie[] cookies = httpRequest.getCookies();
        if (cookies != null) {
            MemberDao memberDao = new MemberDao();
            CoachDao coachDao = new CoachDao();

            for (Cookie cookie : cookies) {
                String id = cookie.getName();
                String password = cookie.getValue();

                try {
                    // Try to log in as a member first
                    Member member = memberDao.checkLogin(id, password);
                    if (member != null) {
                        // Create a new session
                        session = httpRequest.getSession(true);
                        session.setAttribute("id", member.getIDMember());
                        session.setAttribute("role", "member");
                        session.setAttribute("username", member.getMemberName());
                        session.setAttribute("coachId", member.getIDCoach());
                        break; // Exit loop after successful login
                    }

                    // If not a member, try to log in as a coach
                    Coach coach = coachDao.checkLogin(id, password);
                    if (coach != null) {
                        session = httpRequest.getSession(true);
                        session.setAttribute("id", coach.getIDCoach());
                        session.setAttribute("role", "coach");
                        session.setAttribute("username", coach.getCoachName());
                        session.setAttribute("coachId", coach.getIDCoach());
                        break; // Exit loop after successful login
                    }
                } catch (Exception e) {
                    // Log the exception
                    e.printStackTrace();
                }
            }
        }

        // Continue the filter chain
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Cleanup code, if needed
    }
}
