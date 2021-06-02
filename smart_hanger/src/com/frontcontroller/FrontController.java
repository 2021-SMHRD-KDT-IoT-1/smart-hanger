package com.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.Command;
import com.controller_Class.JoinServiceCon;
import com.controller_Class.LoginServiceCon;
import com.controller_Class.LogoutServiceCon;



@WebServlet("*.do")  // *�� ���ؼ� .do��� Ȯ���ڰ� ���� ģ������ �� �� �������� ���� ����� �ش�.
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		//���ڵ�
		request.setCharacterEncoding("euc-kr");
		
		System.out.println("FrontController");
		
		//getRequestURI : � jsp/servlet���� �������� �˱����� �Լ�
		String reqURI = request.getRequestURI();
		System.out.println("��𿡼� �Դ���? : "+reqURI);
		
		//Project�̸����
		String path = request.getContextPath();
		System.out.println("������Ʈ �̸���? : "+path);
		
		// servlet �̸��� ����ϱ�
		// ���ڿ� �ڸ��� �Լ� : substring
		// substring(start) : start��ġ���� ������ ���ڿ� �ڸ���
		// substring(start, end) : start���� end��ġ���� ���ڿ� �ڸ���
		// path�� ���̿� +1�� ���� ���� : '/' �̰͵� �����ϱ� ������
		String resultURI = reqURI.substring(path.length()+1);
		System.out.println("���� �̸� : "+resultURI);
		
		
		//��ĳ���� �ϱ� ���ؼ� ����Ŭ���� ����
		Command command = null;
		
		
		
		
		if(resultURI.equals("LoginServiceCon.do")) {
			command = new LoginServiceCon();}
			
			
			
			
		else if(resultURI.equals("JoinServiceCon.do")) {
			command = new JoinServiceCon();}
			
			
			
//		}else if(resultURI.equals("DeleteServiceCon.do")) {
//			command = new DeleteServiceCon();
//			
//			
//			
//			
		else if(resultURI.equals("LogoutServiceCon.do")) {
			command = new LogoutServiceCon();}
			
			
			
			
//		}else if(resultURI.equals("MessageDeleteServiceCon.do")) {
//			command = new MessageDeleteServiceCon();
//			
//			
//			
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
//		}else if(resultURI.equals("UpdateServiceCon.do")) {
//			command = new UpdateServiceCon();
//			
//			
//			
//		}else if(resultURI.equals("WriterBoard.do")) {
//			command = new WriterBoard();
//			
//		}
		
		String moveURL = command.execute(request, response);
		response.sendRedirect(moveURL);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
