package com.frontcontroller;

import java.io.IOException;

import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.Command;
import com.controller_Class.ClothesOneDeleteServicCon;
import com.controller_Class.ClothesUpdateServiceCon;
//import com.controller_Class.DeleteServiceCon;
import com.controller_Class.JoinServiceCon;
import com.controller_Class.LoginServiceCon;
import com.controller_Class.LogoutServiceCon;
//import com.controller_Class.MessageDeleteOneServiceCon;
//import com.controller_Class.MessageDeleteServiceCon;
//import com.controller_Class.MessageServiceCon;
//import com.controller_Class.UpdateServiceCon;
//import com.controller_Class.WriterBoard;
//import com.model.WebBoardDAO;
//import com.model.WebBoardDTO;
//import com.model.WebMessageDAO;
//import com.model.WebMessageDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



@WebServlet("*.do")  // *�� ���ؼ� .do��� Ȯ���ڰ� ���� ģ������ �� �� �������� ���� ����� �ش�.
public class FrontController extends HttpServlet {

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
		
		request.setCharacterEncoding("EUC-KR");
		
		//��ĳ���� �ϱ� ���ؼ� ����Ŭ���� ����
		Command command = null;
		
		
		
		
		if (resultURI.equals("LoginServiceCon.do")) {
			command = new LoginServiceCon();

		}

		else if (resultURI.equals("JoinServiceCon.do")) {
			System.out.println("����!");
			command = new JoinServiceCon();
		}
		
		else if (resultURI.equals("LogoutServiceCon.do")) {
			command = new LogoutServiceCon();
			
			
			
//		}else if(resultURI.equals("JoinServiceCon.do")) {
//			command = new JoinServiceCon();
//			
//			
//			
//		}else if(resultURI.equals("DeleteServiceCon.do")) {
//			command = new DeleteServiceCon();
//			
//			
//			
//			
//		}else if(resultURI.equals("LogoutServiceCon.do")) {
//			command = new LogoutServiceCon();
//			
//			
//			
//			
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
			
			
		// ����� ��ϵ� �� ����	
		}else if(resultURI.equals("ClothesOneDeleteServicCon.do")) {
			command = new ClothesOneDeleteServicCon();
			
			
			
	    // ����� �� ���� 
		}else if(resultURI.equals("ClothesUpdateServiceCon.do")) {
			command = new ClothesUpdateServiceCon();
			
		}
		
		
		String moveURL = command.execute(request, response);
		System.out.println(moveURL);
		response.sendRedirect(moveURL);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
