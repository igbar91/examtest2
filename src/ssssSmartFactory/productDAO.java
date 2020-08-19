package ssssSmartFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class productDAO {

	
		Connection conn;
	   PreparedStatement pstmt;
	   ResultSet rs;
	   
	  public void getConnection() {
		  
		  
		  try {
			  Context initctx = new InitialContext();
			  Context envctx = (Context) initctx.lookup("java:comp/env");
			  DataSource ds = (DataSource) envctx.lookup("jdbc/oracle");
			  conn = ds.getConnection();
			  
		  }catch(Exception e) {
			  e.printStackTrace();
		  }
	  }
	  
	  public void inputProduct(productBean pbean) {
		  
		getConnection();
		
		try {
			
			String sql = "insert into productLookUp values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pbean.getCode());
			pstmt.setString(2, pbean.getProductname());
			pstmt.setString(3, pbean.getProductsize());
			pstmt.setString(4, pbean.getProductdif());
			pstmt.setString(5, pbean.getPrice());
			
			pstmt.executeUpdate();
			
			conn.close();
						
		}catch(Exception e) {
			e.printStackTrace();
		}
		  
	  }//end  inputProduct
	  
	  
	  public Vector<productBean> outputProduct(){
		
		  getConnection();
		  Vector<productBean> vec = new Vector<productBean>();
		  
		  try {
			  
			  String sql = "select * from productLookUp";
			  pstmt = conn.prepareStatement(sql);
			  rs = pstmt.executeQuery();
			  
			  while(rs.next()) {
				  productBean pbean = new productBean();
				  pbean.setCode(rs.getString(1));
				  pbean.setProductname(rs.getString(2));
				  pbean.setProductsize(rs.getString(3));
				  pbean.setProductdif(rs.getString(4));
				  pbean.setPrice(rs.getString(5));
				  
				  
				  
				  vec.add(pbean);
			  }
			  conn.close();
		
		  }catch(Exception e) {
			  
			  e.printStackTrace();
		  }
		  
		  return vec;
		  
	  }
	  
	  //작업지시서조회 인풋
	  public void insertWorkLookUp(productBean pbean) {
		  
		  getConnection();
		  
		  try {
			  String sql = "insert into WorkCodeLookUp2 values(?, ?, ?, ?, ?, ?, ?)";
			  pstmt = conn.prepareStatement(sql);
			  
			  pstmt.setString(1, pbean.getWorkcode());
			  pstmt.setString(2, pbean.getCode());
			  pstmt.setString(3, pbean.getProductname());
			  pstmt.setString(4, pbean.getProductsize());
			  pstmt.setString(5, pbean.getProductdif());
			  pstmt.setInt(6, pbean.getQuantity());
			  pstmt.setString(7, pbean.getStartdate());
			  
			
			  
			  pstmt.executeUpdate();
			  
			  conn.close();
			  
		  }catch(Exception e) {
			  e.printStackTrace();
		  
		  }	  
		  
	  }//end workLookup
	  
	  
	  public Vector<productBean> outputWorkLookUp(){
	
		  getConnection();
		  Vector<productBean> vec = new Vector<productBean>();
		  
		  try {
		  
			  String sql = "select wcl.workcode, pl.code, pl.productname, pl.productsize, pl.productdif, wcl.quantity, wcl.startdate from productLookup pl join WorkCodeLookUp2 wcl on pl.code = wcl.code";
			  pstmt=conn.prepareStatement(sql);
			  rs=pstmt.executeQuery();
			  while(rs.next()) {
				productBean pbean = new productBean();
				pbean.setWorkcode(rs.getString(1));
				pbean.setCode(rs.getString(2));
				pbean.setProductname(rs.getString(3));
				pbean.setProductsize(rs.getString(4));
				pbean.setProductdif(rs.getString(5));
				pbean.setQuantity(rs.getInt(6));
				pbean.setStartdate(rs.getString(7));
				
				vec.add(pbean);
				
			  }
			  
		  
		  }catch(Exception e) {
			  
			  e.printStackTrace();
		  }
		  

			return vec;
	  }
	  
	  
	  
	  public void inputRegister(RegisterBean rbean) { //작업공정등록
		  
		  getConnection();
		  
		  try{
			  String sql = "insert into workRegister values(?, ?, ?, ?, ?, ?, ?, ?, ? )";
			  pstmt = conn.prepareStatement(sql);
			  
 
			  pstmt.setString(1, rbean.getWorkcode());
			  pstmt.setString(2, rbean.getPreparestuff());
			  pstmt.setString(3, rbean.getPrintstep());
			  pstmt.setString(4, rbean.getCoatingstep());
			  pstmt.setString(5, rbean.getHapjistep());
			  pstmt.setString(6, rbean.getTogetherstep());
			  pstmt.setString(7, rbean.getBoxingstep());
			  pstmt.setString(8, rbean.getTotalday());
			  pstmt.setString(9, rbean.getTotaltime());
				  		 
			  pstmt.executeUpdate();
			  
			  conn.close();
  
		  }catch(Exception e) {
			  e.printStackTrace();
		  }

		  
	  }
	  
	  
	  public Vector<RegisterBean> outputRegister(){
		  
		  getConnection();
		  Vector<RegisterBean> vec = new Vector<RegisterBean>();
		  
		  try {
			 String sql = "select wcl.workcode, wcl.code, pl.productname, wr.printstep, wr.coatingstep, "+ 
			  "wr.hapjistep, wr.togetherstep, wr.boxingstep, wr.totalday, wr.totaltime "+ 
			  "from productLookUp pl, WorkCodeLookUp2 wcl, workRegister wr "+
			  "where pl.code = wcl.code "+ 
			  "and wcl.workcode = wr.workcode " +
			  "order by wcl.workcode";
			 
			 pstmt = conn.prepareStatement(sql);
			 rs = pstmt.executeQuery();
					 
			while(rs.next()) {
				RegisterBean rbean = new RegisterBean();
				rbean.setWorkcode(rs.getString(1));
				rbean.setCode(rs.getString(2));
				rbean.setProductname(rs.getString(3));
				rbean.setPrintstep(rs.getString(4));
				rbean.setCoatingstep(rs.getString(5));
				rbean.setHapjistep(rs.getString(6));
				rbean.setTogetherstep(rs.getString(7));
				rbean.setBoxingstep(rs.getString(8));
				rbean.setTotalday(rs.getString(9));
				rbean.setTotaltime(rs.getString(10));
				
				vec.add(rbean);
				
			}
			
			conn.close();
  
		  }catch(Exception e) {
			  
				e.printStackTrace();
		  
		  }
		  return vec;
	  }
	  
	  
	  
	  public RegisterBean updateWorkRegister(String workcode) {
		  
		  getConnection();
		  RegisterBean rbean = new RegisterBean();
		  
		  try {
		  
			  String sql = "select * fromworkRegister where workcode=?";
		  
			  pstmt = conn.prepareStatement(sql);
			  pstmt.setString(1, workcode);
			  rs = pstmt.executeQuery();
			  
			  if(rs.next()){
				  rbean.setPreparestuff(rs.getString(1));
				  rbean.setPrintstep(rs.getString(2));
				  rbean.setCoatingstep(rs.getString(3));
				  rbean.setHapjistep(rs.getString(4));
				  rbean.setTogetherstep(rs.getString(5));
				  rbean.setBoxingstep(rs.getString(6));
				  rbean.setTotalday(rs.getString(7));
				  rbean.setTotaltime(rs.getString(8));
				  rbean.setWorkcode(rs.getString(9));
				  rbean.setTotalday(rs.getString(10));
				  rbean.setTotaltime(rs.getString(11));
				  
	
					 
			  }		
		  
		
		  conn.close();
		  }catch(Exception e) {
			  
			  e.printStackTrace();
			  
		  }
		return rbean;
		  
		  }
	  
	  
		//수정하기
		public void update(RegisterBean rbean) {
			
			getConnection();
			
			try {
				String sql = "update from workRegister set preparestuff=?, printstep=?, coatingstep=?, hapjistep=?, togetherstep=? "
						+ "boxingstep=?, totalday=?, totaltime=? where workcode=?";
		
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, rbean.getPreparestuff());
				pstmt.setString(2, rbean.getPrintstep());
				pstmt.setString(3, rbean.getCoatingstep());
				pstmt.setString(4, rbean.getHapjistep());
				pstmt.setString(5, rbean.getTogetherstep());
				pstmt.setString(6, rbean.getBoxingstep());
				pstmt.setString(7, rbean.getTotalday());
				pstmt.setString(8, rbean.getTotaltime());
				pstmt.setString(9, rbean.getWorkcode());
				
				
			
				  
				
				
				
				pstmt.executeUpdate();
				
				conn.close();
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	
//	  String sql = "update workRegister set preparestuff=?, printstep=?, coatingstep=?, hapjistep=?, "
//		  		+ "togetherstep=?, boxingstep=?, totalday=?, totaltime=? where workcode=?";
}//end
