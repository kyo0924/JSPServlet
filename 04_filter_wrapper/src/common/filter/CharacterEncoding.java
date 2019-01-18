package common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import common.wrapper.WrapperTest;

/**
 * Servlet Filter implementation class CharacterEncoding
 */
//@WebFilter("/filter.do") // 패턴방식
@WebFilter(servletNames={"FilterTestServlet","LoginServlet"}) //서블릿 이름
//@WebServlet(name="FilterTestServlet", urlPatterns="/filter.do")
public class CharacterEncoding implements Filter {

    /**
     * Default constructor. 
     */
    public CharacterEncoding() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		System.out.println("안녕 필터~");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		WrapperTest wt = new WrapperTest((HttpServletRequest) request);
		
		
		// pass the request along the filter chain
//		chain.doFilter(request, response);
		chain.doFilter(wt, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
