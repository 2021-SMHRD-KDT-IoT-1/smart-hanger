package com.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.Command;
import com.controller_Class.ClothesAddServiceCon;
import com.controller_Class.ClothesOneDeleteServicCon;
import com.controller_Class.ClothesUpdateServiceCon;
import com.controller_Class.CodyAddServiceCon;
import com.controller_Class.JoinServiceCon;
import com.controller_Class.LoginServiceCon;
import com.controller_Class.LogoutServiceCon;
import com.controller_Class.MemberUpdateServiceCon;
import com.controller_Class.UserServiceCon;
import com.controller_Class.WriteCommuCon;



@WebServlet("*.do") // *�� ���ؼ� .do��� Ȯ���ڰ� ���� ģ������ �� �� �������� ���� ����� �ش�.
public class FrontController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// ���ڵ�
		request.setCharacterEncoding("euc-kr");

		// getRequestURI : � jsp/servlet���� �������� �˱����� �Լ�
		String reqURI = request.getRequestURI();

		// Project�̸����
		String path = request.getContextPath();

		// servlet �̸��� ����ϱ�
		// ���ڿ� �ڸ��� �Լ� : substring
		// substring(start) : start��ġ���� ������ ���ڿ� �ڸ���
		// substring(start, end) : start���� end��ġ���� ���ڿ� �ڸ���
		// path�� ���̿� +1�� ���� ���� : '/' �̰͵� �����ϱ� ������
		String resultURI = reqURI.substring(path.length() + 1);
		System.out.println("���� �̸� : " + resultURI);

		request.setCharacterEncoding("EUC-KR");

		// ��ĳ���� �ϱ� ���ؼ� ����Ŭ���� ����
		Command command = null;

		
		
		if (resultURI.equals("LoginServiceCon.do")) {
			command = new LoginServiceCon();
		
		}else if (resultURI.equals("JoinServiceCon.do")) {
			command = new JoinServiceCon();
		
		}else if (resultURI.equals("LogoutServiceCon.do")) {
			command = new LogoutServiceCon();
			
	 			
//			
//			
//		}else if(resultURI.equals("MessageDeleteOneServiceCon.do")) {
//			command = new MessageDeleteOneServiceCon();
//			
//		
//			
//		}else if(resultURI.equals("MessageServiceCon.do")) {
//			command = new MessageServiceCon();
//			
//			
//			
			// ȸ�� ���� ����
			
		}else if(resultURI.equals("MemberUpdateServiceCon.do")) {
			command = new MemberUpdateServiceCon();
			
			
			

//		}else if(resultURI.equals("UpdateServiceCon.do")) {
//			command = new UpdateServiceCon();
//			
//			
//		
			//���� ������ ���
		} else if (resultURI.equals("UserServiceCon.do")) {
			command = new UserServiceCon();	
            //����� �ڵ� ���
		} else if (resultURI.equals("CodyAddServiceCon.do")) {
			command = new CodyAddServiceCon();
			// ����� �� ���
		} else if (resultURI.equals("ClothesAddServiceCon.do")) {
			command = new ClothesAddServiceCon();

			// ����� ��ϵ� �� ����
		} else if (resultURI.equals("ClothesOneDeleteServicCon.do")) {
			command = new ClothesOneDeleteServicCon();

			// ����� �� ����
		} else if (resultURI.equals("ClothesUpdateServiceCon.do")) {
			command = new ClothesUpdateServiceCon();


		}
		else if(resultURI.equals("WriteCommuCon.do")) {
			command = new WriteCommuCon();
			}
		
		
		String moveURL = command.execute(request, response);
		response.sendRedirect(moveURL);
	}
}