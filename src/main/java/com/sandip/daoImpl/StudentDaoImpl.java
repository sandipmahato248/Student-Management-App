package com.sandip.daoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.sandip.dao.StudentDao;

import com.sandip.jdbc.StudentRowMapper;
import com.sandip.model.Student;
@Repository
public class StudentDaoImpl implements StudentDao {
	@Autowired
	DataSource dataSource;
//		This Method is used to save data in table student1.
	public Student saveStudent(Student student) {
		String sql="INSERT INTO student1"+"(name,address,roll) VALUES(?,?,?)";
		JdbcTemplate jdbcTemplate=new JdbcTemplate(dataSource);
		int id = jdbcTemplate.update(sql,new Object[]{student.getName(),student.getAddress(),student.getRoll()});
		return getStudent(id);
	}
//		This method is used to show all the data from the table.
	public List<Student> studentList() {
		List<Student> studentList = new ArrayList<Student>();
		String sql = "select * from student1";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		studentList = jdbcTemplate.query(sql, new StudentRowMapper());
		return studentList;
		
	}
//   This Method is used to Delete Data 
	public Student deleteStudent(int id) {
		String sql="delete from student1 where id="+id;
		JdbcTemplate jdbcTemplate=new JdbcTemplate(dataSource);
		int id1 = jdbcTemplate.update(sql);
		return getStudent(id1);
	}


//	This method is used to Update Data
	public Student updateStudent(Student student) {
		String sql="update student1 set name=?,address=?,roll=? where id=?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		int id = jdbcTemplate.update(sql, new Object[]{student.getName(),student.getAddress(),student.getRoll(),student.getId()});
		return getStudent(id);
	}

	public Student getStudent(int id) {
		List<Student> studentList=new ArrayList<Student>();
		String sql="select * from student1 where id="+ id ;
		JdbcTemplate jdbcTemplate=new JdbcTemplate(dataSource);
		studentList=jdbcTemplate.query(sql,new StudentRowMapper());
		return studentList.get(0);
	}
}
