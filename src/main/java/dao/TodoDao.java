package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.TodoDto;



public class TodoDao {
	private static final String DB_URL = "jdbc:mysql://localhost:3306/connectdb?characterEncoding=UTF-8";
	private static final String DB_USER = "connectuser";
	private static final String DB_PASSWD = "1234";
	
	
	public int addTodo(TodoDto todo) {
		int insertCnt = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String sql = "INSERT INTO todo(title, name, sequence) VALUES (?, ?, ?)";
		try(Connection conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWD);
			PreparedStatement ps = conn.prepareStatement(sql);){ 
			ps.setString(1, todo.getTitle());
			ps.setString(2, todo.getName());
			ps.setInt(3, todo.getSequence());
			
			insertCnt=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return insertCnt;
	}

	public List<TodoDto> getTodos() {
		List<TodoDto> list=new ArrayList<>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String sql="SELECT id, title, name, sequence, type, regdate FROM todo ORDER BY regdate ASC";
		
		try (Connection conn=DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWD);
			PreparedStatement ps=conn.prepareStatement(sql); 
			ResultSet rs=ps.executeQuery()){ 
				while(rs.next()) {
					long id=rs.getLong(1);
					String title=rs.getString(2);
					String name=rs.getString(3);
					int sequence=rs.getInt(4);
					String type=rs.getString(5);
					String regdate=rs.getString(6);
					
					TodoDto todo=new TodoDto(id, title, name, sequence, type, regdate);
					list.add(todo);					
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		
		return list;
	}
	
	public int updateTodo(TodoDto todo) {
		int updateCnt = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String sql = "UPDATE todo SET type = ? WHERE id = ?";
		
		try(Connection conn=DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWD);
			PreparedStatement ps=conn.prepareStatement(sql);){ 

			ps.setString(1, todo.getType());
			ps.setLong(2, todo.getId());
			
			updateCnt=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updateCnt;
	}
}