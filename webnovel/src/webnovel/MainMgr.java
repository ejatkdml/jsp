package webnovel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Vector;

import bean.CountBean;
import bean.NovelBean;
import bean.UserBean;

public class MainMgr {

	private DBConnectionMgr pool;
	private final SimpleDateFormat SDF_DATE = new SimpleDateFormat("yyyy'��'  M'��' d'��' (E)");
	private final SimpleDateFormat SDF_TIME = new SimpleDateFormat("H:mm:ss");

	public MainMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	// Join Login
	public boolean loginJoin(String u_id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select * from user where u_id=? and passward =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u_id);
			pstmt.setString(2, pwd);
			if (pstmt.executeQuery().next())
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

	// Join Information
	public UserBean getJoin(String u_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		UserBean bean = new UserBean();
		try {
			con = pool.getConnection();
			sql = "select * from user where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setU_id(rs.getString(1));
				bean.setPassward(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setGender(rs.getInt(4));
				bean.setBirth(rs.getString(5));
				bean.setCreated(rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	// GuestBook Insert
//	public void insertGuestBook(GuestBookBean bean) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		String sql = null;
//		try {
//			con = pool.getConnection();
//			sql = "insert tblGuestBook(id,contents,ip,regdate,regtime,secret)"
//					+ "values(?,?,?,now(),now(),?)";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, bean.getId());
//			pstmt.setString(2, bean.getContents());
//			pstmt.setString(3, bean.getIp());
//			pstmt.setString(4, bean.getSecret());
//			pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			pool.freeConnection(con, pstmt);
//		}
//		return;
//	}

	// GuestBook List
//	public Vector<NovelBean> listGuestBook(String id, String grade){
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = null;
//		Vector<GuestBookBean> vlist = new Vector<GuestBookBean>();
//		try {
//			con = pool.getConnection();
//			if(grade.equals("1")) {//������
//				sql = "select * from tblGuestBook order by num desc";
//				pstmt = con.prepareStatement(sql);
//			}else if(grade.equals("0")){//�Ϲ� �α��� : ���� + �ٸ� ��� �Ϲݱ�
//				sql = "select * from tblGuestBook "
//				+ "where id=? or secret='0' order by num desc";
//				pstmt = con.prepareStatement(sql);
//				pstmt.setString(1, id);
//			}
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				GuestBookBean bean = new GuestBookBean();
//				bean.setNum(rs.getInt("num"));
//				bean.setId(rs.getString("id"));
//				bean.setContents(rs.getString("contents"));
//				bean.setIp(rs.getString("ip"));
//				String tempDate = SDF_DATE.format(rs.getDate("regDate"));
//				bean.setRegdate(tempDate);
//				String tempTime = SDF_TIME.format(rs.getTime("regTime"));
//				bean.setRegtime(tempTime);
//				bean.setSecret(rs.getString("secret"));
//				vlist.addElement(bean);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			pool.freeConnection(con, pstmt, rs);
//		}
//		return vlist;
//	}
//	
//	//GuestBook Read : ��¥�� �ð��� list �����ϰ�
//	public GuestBookBean getGuestBook(int num) {}
//	
//	//GuestBook Update : Contents, ip, secret
//	public void updateGuestBook(GuestBookBean bean) {}
//	
//	//GuestBook Delete
//	public void deleteGuestBook(int num) {}

	///// Comment ���///////////

	public CountBean DataCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		CountBean bean = new CountBean();
		try {
			con = pool.getConnection();
			sql = "SELECT COUNT(n.n_id ) ,COUNT(t.t_id),COUNT(a.a_id), COUNT(w.w_id),COUNT(p.p_id),COUNT(c.c_id), COUNT(t2.tr_id) FROM Novel n,tag t ,author a ,webplatform w ,publisher p ,`Character` c ,trait t2";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setNovelcnt(rs.getInt(1));
				bean.setTagcnt(rs.getInt(2));
				bean.setAuthorcnt(rs.getInt(3));
				bean.setWebcnt(rs.getInt(4));
				bean.setPubcnt(rs.getInt(5));
				bean.setCharactercnt(rs.getInt(6));
				bean.setTraitcnt(rs.getInt(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
}
