package com.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.Command;
import com.controller_Class.ClothesAddServiceCon;
import com.controller_Class.ClothesAddServieceCon2;
import com.controller_Class.ClothesAddformServiceCon2;
import com.controller_Class.ClothesOneDeleteServicCon;
import com.controller_Class.ClothesUpdateServiceCon;
import com.controller_Class.CodyAddServiceCon;
import com.controller_Class.CodyAddformServiceCon2;
import com.controller_Class.CodyCommentsInsertCon;
import com.controller_Class.CodySaveServiceCon;
import com.controller_Class.CommunityCommentsInsertCon;
import com.controller_Class.JoinServiceCon;
import com.controller_Class.LoginServiceCon;
import com.controller_Class.LogoutServiceCon;
import com.controller_Class.MemberUpdateServiceCon;
import com.controller_Class.ClothesSaveServiceCon;
import com.controller_Class.UserServiceCon;
import com.controller_Class.WriteCommuCon;



@WebServlet("*.do") // *�� ���ؼ� .do��� Ȯ���ڰ� ���� ģ������ �� �� �������� ���� ����� �ش�.
public class FrontController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// ���ڵ�
		request.setCharacterEncoding("euc-kr");

		// getRequestURI : � jsp/servlet���� �������� �˱����� �Լ�
		String reqURI = request.getRequestURI();

		//System.out.println(reqURI);
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

		
		// �α���
		if (resultURI.equals("LoginServiceCon.do")) {
			command = new LoginServiceCon();
			
			// ȸ������
			/* } else if (resultURI.equals("JoinServiceCon.do")) { command = new
			 * JoinServiceCon(); */
			
			// �α׾ƿ�
		} else if (resultURI.equals("LogoutServiceCon.do")) {
			command = new LogoutServiceCon();
			// ȸ�� ���� ����
		} else if (resultURI.equals("zSmart_hanger/user_manager/MemberUpdateServiceCon.do")) {
			command = new MemberUpdateServiceCon();
			
			
			
			// ���� �� �߰�
		} else if (resultURI.equals("zSmart_hanger/cloth/ClothesAddServiceCon.do")) {
			command = new ClothesAddServiceCon();
			// ���� ����
		} else if (resultURI.equals("zSmart_hanger/cloth/ClothesSaveServiceCon.do")) {
			command = new ClothesSaveServiceCon();


		
			
			

			// ����� �� ���
		} else if (resultURI.equals("zSmart_hanger/cloth/ClothesAddServiceCon.do")) {
			command = new ClothesAddServiceCon();
			
			// ����� �� ���
		} else if (resultURI.equals("zSmart_hanger/cloth/ClothSaveServiceCon.do")) {
			command = new ClothesSaveServiceCon();

			// ����� ��ϵ� �� ����
		} else if (resultURI.equals("zSmart_hanger/cloth/ClothesOneDeleteServicCon.do")) {
			command = new ClothesOneDeleteServicCon();
			// ����� �� ����
		} else if (resultURI.equals("zSmart_hanger/cloth/ClothesUpdateServiceCon.do")) {
			command = new ClothesUpdateServiceCon();
			
			
			
			// �ڵ� ���� �Կ� ���� �����
		} else if (resultURI.equals("zSmart_hanger/cody/CodySaveServiceCon.do")) {
			command = new CodySaveServiceCon();
			//  �ڵ� ���1
		} else if (resultURI.equals("zSmart_hanger/cody/CodyAddServiceCon.do")) {
			command = new CodyAddServiceCon();
			//  �ڵ� ���2
		} else if (resultURI.equals("CodyAddformServiceCon2.do")) {
			command = new CodyAddformServiceCon2();
			// �ڵ� ��� ���
		} else if (resultURI.equals("zSmart_hanger/cody/CodyCommentsInsertCon.do")) {
			command = new CodyCommentsInsertCon();
			
			
			

			// Ŀ�´�Ƽ �� �ۼ�
		} else if (resultURI.equals("zSmart_hanger/community/WriteCommuCon.do")) {
			command = new WriteCommuCon();
			// Ŀ�´�Ƽ ��� �ۼ�
		} else if (resultURI.equals("zSmart_hanger/community/CommunityCommentsInsertCon.do")) {
			command = new CommunityCommentsInsertCon();

			
			
	

			
			
			
			
			
			
			// ���� ������ ���
		} else if (resultURI.equals("zSmart_hanger/service/UserServiceCon.do")) {
			command = new UserServiceCon();
		}

		
		String moveURL = command.execute(request, response);
		response.sendRedirect(moveURL);
	}
}