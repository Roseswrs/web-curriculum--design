```java 
/**
*14130140359 肖蜜
*
*/
package com.classInfo.Servlet;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.classInfo.Utils.VerifyCode;

public class VerifyCodeServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		VerifyCode verifyCode = new VerifyCode();
		BufferedImage image = verifyCode.getImage();
		String text = verifyCode.getText();
		HttpSession session = request.getSession();
		session.setAttribute("verifyCode", text);
		VerifyCode.output(image, response.getOutputStream());
	}

}
