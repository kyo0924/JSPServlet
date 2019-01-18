package common.wrapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class WrapperTest extends HttpServletRequestWrapper {
	
	//생성자 생성 => 매개변수가 있는 생성자 생성
	// HttpServletRequest가 매개변수 (container)
	public WrapperTest(HttpServletRequest request) {
		super(request);
	}

	@Override
	public String getParameter(String name) {
		// TODO Auto-generated method stub
		String orival = super.getParameter(name);
		orival += "병승";
		
		
		
		return orival;
	}

	
}
